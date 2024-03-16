# Dockerfile image template for setting up a Python scripting/programming integrated development environment (IDE)
FROM alpine:latest AS base

# Update package manager database, Upgrade repository packages and Install dependencies
RUN apk update && apk upgrade \
    && apk add bash git make alpine-sdk shadow sudo coreutils python3 py3-pip py3-virtualenv

# Set Entry Point
ENTRYPOINT \
    ## $0 will take the executable's name (1st argument) \
    ## $@ will take all subsequent arguments (parameters) \
    ## Summary: \
    ## - argument [0] as the executable, and \
    ## - arguments [1:] as the parameters \
    exec "$0" "$@"

