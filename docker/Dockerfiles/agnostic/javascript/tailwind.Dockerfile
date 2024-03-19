# Stage 2 Post-setup Dockerfile image template for adding Tailwind to an IDE base image
ARG BASE_IMAGE_NAME="thanatisia/docker-ide"
ARG BASE_IMAGE_TAG="javascript"
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG} AS base

# Arguments and variables

# Environment Variables

# Update package manager database, Upgrade repository packages and Install dependencies
## Install NPM packages
RUN npm install -g tailwindcss

# Build external dependencies from Source

