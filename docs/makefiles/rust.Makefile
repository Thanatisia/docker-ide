# Makefile
# for building images

## Variables/Ingredients

### Images

#### Stage 1 (Base)
STAGE_1_IMAGE_NAME ?= thanatisia/docker-ide
STAGE_1_IMAGE_TAG ?= [base-distributions]
STAGE_1_BUILD_ARGS ?= 
STAGE_1_DOCKERFILE ?= docker/Dockerfiles/[base-distributions]/programming-languages/rust.Dockerfile

#### Stage N (Multistaged build - Add-on Dockerfiles)
STAGE_2_IMAGE_NAME ?= thanatisia/docker-ide
STAGE_2_IMAGE_TAG ?= rust
STAGE_2_BUILD_ARGS ?= # --build-arg "USER_NAME=${USER}" \
              --build-arg "USER_PRIMARY_GROUP=wheel" \
			  --build-arg "USER_SECONDARY_GROUPS=users" \
			  --build-arg "USER_SHELL=/bin/bash" \
			  --build-arg "USER_DEFAULT_HOME=${HOME}" \
			  --build-arg "USER_OPTS=-m" # Set Build Arguments
STAGE_2_DOCKERFILE ?= docker/Dockerfiles/[base-distributions]/add-on-images/nvim.Dockerfile
CONTEXT ?= .

### Containers
CONTAINER_IMAGE_NAME ?= thanatisia/docker-ide
CONTAINER_IMAGE_TAG ?= rust
CONTAINER_NAME ?= dev-env-rust
CONTAINER_OPTS ?= \
				  --restart=unless-stopped \
				  --workdir=/projects # Other Options; i.e. --user=${USER}
CONTAINER_PORT_FORWARDING ?=    # Port Forward/Translate/Map from host system to container; -p "[host-ip-address]:[host-system-port]:[container-port]"
CONTAINER_MOUNT_VOLUMES ?= \
						   -v "${PWD}/projects/rust:/projects" \
						   -v "${HOME}/.config/:${HOME}/.config/" # Mount Host System Volume; -v "[host-system-volume]:[container-volume]:[permissions]"
CONTAINER_PASSTHROUGH_DEVICE ?= # --device "[host-system-device-file]:[container-mount-point]"

### Remote Connection
SERVER_USER_NAME = 
SERVER_IP_ADDRESS = 
SERVER_SHELL ?= /bin/bash

SHELL := /bin/bash
.PHONY := help build-stage-1 run
.DEFAULT_RULES := help

## Recipe/Targets
help:
	## Display help message
	@echo -e "[+] help : Display Help message"
	@echo -e "[+] build-stage-1 : Build Stage 1 image from multi-stage build"
	@echo -e "[+] run : Startup a container from an image"
	@echo -e "[+] enter : Chroot and enter the container"
	@echo -e "[+] ssh : SSH and connect to the container from a remote host"
	@echo -e "[+] start : Start the container if stopped and exists"
	@echo -e "[+] stop : Stop the container if running"
	@echo -e "[+] restart : Restart the container if running"
	@echo -e "[+] remove : Remove the container if exists"
	@echo -e "[+] logs : Display logs of the container"

build-stage-1:
	## Build image from Dockerfile
	@docker build \
		-t ${STAGE_1_IMAGE_NAME}:${STAGE_1_IMAGE_TAG} \
		${STAGE_1_BUILD_ARGS} \
		-f ${STAGE_1_DOCKERFILE} \
		${CONTEXT}

build-stage-2:
	## Build stage 2 image from Dockerfile
	@docker build \
		-t ${STAGE_2_IMAGE_NAME}:${STAGE_2_IMAGE_TAG} \
		${STAGE_2_BUILD_ARGS} \
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

enter:
	## Chroot and enter the container
	@docker exec -it ${CONTAINER_NAME} ${SHELL}

ssh:
	## SSH and connect to the container from a remote host
	@ssh -t ${SERVER_USER_NAME}@${SERVER_IP_ADDRESS} "docker exec -it ${CONTAINER_NAME} ${SERVER_SHELL}"

