# Dockerfile
ARG BUILD_FROM

# Stage 1: The Builder
FROM $BUILD_FROM AS builder
RUN apk add --no-cache build-base git curl-dev openssl-dev automake autoconf libtool

# Build UACME from source (no openssl)
WORKDIR /build/uacme
RUN wget -O - https://github.com/ndilieto/uacme/archive/upstream/latest.tar.gz | tar zx --strip-components=1 && \
    CFLAGS='-O3 -Wall -march=native' ./configure --disable-maintainer-mode --disable-docs --without-ualpn --with-openssl && \
    make

# Build cns
WORKDIR /build/zns
RUN git clone https://github.com/Cronvs/zns.git . && \
    gcc -Os -DUSE_OPENSSL -ffunction-sections -fdata-sections -Wl,--gc-sections -s -o zns src/zns.c -lcrypto

# Stage 2: The Minimal Runtime
FROM $BUILD_FROM

# Setup base
RUN apk add --no-cache snooze libcurl openssl && \
    apk del cron busybox-cron || true && \
    rm -rf /etc/periodic /etc/crontabs /var/spool/cron

COPY --from=builder /build/uacme/uacme /usr/bin/uacme
COPY --from=builder /build/zns/cns /usr/local/bin/cns

# Copy data
COPY rootfs /

WORKDIR /
