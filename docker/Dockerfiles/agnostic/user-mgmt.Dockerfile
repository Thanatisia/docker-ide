# Stage 2 Post-setup Dockerfile image template for adding user to an IDE base image
ARG BASE_IMAGE_NAME="thanatisia/docker-ide"
ARG BASE_IMAGE_TAG="latest"
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG} AS stage-2

# Set Arguments (Local Variables)
ARG USER_NAME="$USER"
ARG USER_PRIMARY_GROUP="wheel"
ARG USER_SECONDARY_GROUPS="users"
ARG USER_SHELL="/bin/bash"
ARG USER_DEFAULT_HOME="$HOME"
ARG USER_OPTS="-m"

# Create user
RUN useradd ${USER_OPTS} -g ${USER_PRIMARY_GROUP} -G ${USER_SECONDARY_GROUPS} -s ${USER_SHELL} -d ${USER_DEFAULT_HOME} ${USER_NAME}

