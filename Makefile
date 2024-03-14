# Makefile
# for building images

## Variables/Ingredients

### Images
IMAGE_NAME ?= thanatisia/docker-ide
IMAGE_TAG ?= c
BUILD_ARGS ?= 
STAGE_1_DOCKERFILE ?= docker/Dockerfiles/[base-distributions]/c.Dockerfile
STAGE_2_DOCKERFILE ?= 
CONTEXT ?= .

### Containers
CONTAINER_IMAGE_NAME ?= thanatisia/docker-ide
CONTAINER_IMAGE_TAG ?= c
CONTAINER_NAME ?= dev-env-c
CONTAINER_OPTS ?= --restart=unless-stopped --workdir=/src
CONTAINER_PORT_FORWARDING ?=    # -p "[host-ip-address]:[host-system-port]:[container-port]"
CONTAINER_MOUNT_VOLUMES ?= -v "${PWD}/src/c:/src"     # -v "[host-system-volume]:[container-volume]:[permissions]"
CONTAINER_PASSTHROUGH_DEVICE ?= # --device "[host-system-device-file]:[container-mount-point]"

SHELL := /bin/bash
.PHONY := help build-stage-1 run
.DEFAULT_RULES := help

## Recipe/Targets
help:
	## Display help message
	@echo -e "[+] help : Display Help message"
	@echo -e "[+] build-stage-1 : Build Stage 1 image from multi-stage build"
	@echo -e "[+] run : Startup a container from an image"
	@echo -e "[+] start : Start the container if stopped and exists"
	@echo -e "[+] stop : Stop the container if running"
	@echo -e "[+] restart : Restart the container if running"
	@echo -e "[+] remove : Remove the container if exists"
	@echo -e "[+] logs : Display logs of the container"

build-stage-1:
	## Build image from Dockerfile
	@docker build \
		-t ${IMAGE_NAME}:${IMAGE_TAG} \
		${BUILD_ARGS} \
		-f ${STAGE_1_DOCKERFILE} \
		${CONTEXT}

build-stage-2:
	## Build stage 2 image from Dockerfile
	@docker build \
		-t ${IMAGE_NAME}:${IMAGE_TAG} \
		-f ${STAGE_2_DOCKERFILE} \
		${CONTEXT}

run:
	## Startup a container from an image
	@docker run -itd \
		--name=${CONTAINER_NAME} \
		${CONTAINER_OPTS} \
		-e SHELL=${SHELL} \
		${CONTAINER_PORT_FORWARDING} \
		${CONTAINER_MOUNT_VOLUMES} \
		${CONTAINER_IMAGE_NAME}:${CONTAINER_IMAGE_TAG}

start:
	## Start the container if stopped and exists
	@docker start ${CONTAINER_NAME}

stop:
	## Stop the container if running
	@docker stop ${CONTAINER_NAME}

restart:
	## Restart the container if running
	@docker restart ${CONTAINER_NAME}

remove:
	## Remove the container if exists
	@docker rm ${CONTAINER_NAME}

logs:
	## Display logs of the container
	@docker logs ${CONTAINER_NAME}

