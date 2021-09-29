# vim:set ft=dockerfile:

# This Dockerfile builds the newest kernel with RMRR patch
#
# TODO Add support for custom branch of build
FROM debian:bullseye

RUN mkdir -p /build
WORKDIR /build

COPY build.sh /build/build.sh
COPY ./patches/proxmox.patch /build/patches/proxmox.patch
COPY ./patches/add-relaxable-rmrr-5_11.patch /build/patches/add-relaxable-rmrr-5_11.patch

RUN set -x \
  && apt update && apt install -y ca-certificates wget

RUN bash /build/build.sh
