# Dockerfile image template for setting up a C programming integrated development environment (IDE)
FROM archlinux:latest AS base

# Update package manager database, Upgrade repository packages and Install dependencies
RUN pacman -Syu && \
    pacman -S bash git make base-devel gcc clang

# Set Entry Point
ENTRYPOINT ["/bin/bash", "-c"]

