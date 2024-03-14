# Dockerfile image template for setting up a C programming integrated development environment (IDE)
FROM debian:latest AS base

# Update package manager database, Upgrade repository packages and Install dependencies
RUN apt update -y && apt upgrade -y && \
    apt install -y bash git make build-essential gcc clang vim

# Set Entry Point
ENTRYPOINT \
    ## $0 will take the executable's name (1st argument) \
    ## $@ will take all subsequent arguments (parameters) \
    ## Summary: \
    ## - argument [0] as the executable, and \
    ## - arguments [1:] as the parameters \
    exec "$0" "$@"

