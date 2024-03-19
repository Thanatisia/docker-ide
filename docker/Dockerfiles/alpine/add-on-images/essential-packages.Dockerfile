# Stage 2 Post-setup Dockerfile image template for installing essential packages to an IDE base image
ARG BASE_IMAGE_NAME="thanatisia/docker-ide"
ARG BASE_IMAGE_TAG="alpine"
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG} AS stage-2

# Set Arguments (Local Variables)

# Install packages
RUN apk add neovim

