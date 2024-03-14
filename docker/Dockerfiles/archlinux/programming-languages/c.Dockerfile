# Dockerfile image template for setting up a C programming integrated development environment (IDE)
FROM archlinux:latest AS base

# Update package manager database, Upgrade repository packages and Install dependencies
RUN pacman -Syu --noconfirm && \
    pacman -S bash git make base-devel gcc clang vim --noconfirm

# Set Entry Point
ENTRYPOINT \
    ## $0 will take the executable's name (1st argument) \
    ## $@ will take all subsequent arguments (parameters) \
    ## Summary: \
    ## - argument [0] as the executable, and \
    ## - arguments [1:] as the parameters \
    exec "$0" "$@"

