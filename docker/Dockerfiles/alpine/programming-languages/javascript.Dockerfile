# Dockerfile image template for setting up a working Javascript integrated development environment (IDE)
ARG BASE_IMAGE_NAME="alpine"
ARG BASE_IMAGE_TAG="latest"
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG} AS base

# Update package manager database, Upgrade repository packages and Install dependencies
RUN apk update && apk upgrade \
    && apk add --no-cache bash git make alpine-sdk shadow sudo coreutils nodejs

# Build external dependencies from Source

# Set Entry Point
ENTRYPOINT \
    ## $0 will take the executable's name (1st argument) \
    ## $@ will take all subsequent arguments (parameters) \
    ## Summary: \
    ## - argument [0] as the executable, and \
    ## - arguments [1:] as the parameters \
    exec "$0" "$@"

