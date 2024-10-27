# Dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Setup base
RUN apk add --no-cache openssl

# Copy data
COPY rootfs /

WORKDIR /
