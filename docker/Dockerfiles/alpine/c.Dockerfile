# Dockerfile image template for setting up a C programming integrated development environment (IDE)
FROM alpine:latest AS base

# Update package manager database, Upgrade repository packages and Install dependencies
RUN apk update && apk upgrade \
    && apk add bash git make alpine-sdk gcc clang shadow sudo coreutils

# Set Entry Point
ENTRYPOINT \
    ## $0 will take the executable's name (1st argument) \
    ## $@ will take all subsequent arguments (parameters) \
    ## Summary: \
    ## - argument [0] as the executable, and \
    ## - arguments [1:] as the parameters \
    exec "$0" "$@"

