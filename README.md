# Docker-based local/remote (cloud) Integrated Development Environment (IDE)

## Information
### Description
+ Docker-based local/remote (cloud) Integrated Development Environment (IDE) with a idea of how webIDE platforms like repl.it and VPSes operate

## Setup
### Dependencies
+ docker
+ docker-compose

### Using Host System
> This repository is designed to be used with a containerization platform like Docker or LXC, and orchestration systems like Kubernetes (K8s), However, for educational purposes, the following steps is how you would set this up
- Methodologies
    + Install dependencies, APIs, libraries, frameworks, SDKs on host system
    + Using Virtual Machines

### Using docker CLI
- Build docker image
    ```bash
    docker build --tag=[author/image-name]:[version|tag] {--build-args [ARGUMENT_VARIABLE="value"]} -f [custom-dockerfile-template] [context]
    ```

- Startup using docker run
    ```bash
    docker run -itd \
        --name=[container-name] \
        --restart=unless-stopped \
        -e "ENV_VAR=value" \
        --env-file="/path/to/environment-file" \
        --workdir="[container-working-directory]" \
        -p "[host-system-port]:[container-port]" \
        -v "[host-system-volume]:[container-volume]" \
        [author]/[image-name]:[image-tag|version]
    ```

### Using docker-compose
- Startup compose environment
    ```bash
    docker-compose up -d --build
    ```

- Stop and teardown compose environment
    ```bash
    docker-compose down
    ```

- Start container
    ```bash
    docker-compose start {container-name}
    ```

- Stop container
    ```bash
    docker-compose stop {container-name}
    ```

- Restart container(s)
    ```bash
    docker-compose restart {container-name}
    ```

## Makefile
### Variables
#### General
- `CONTEXT` : Specify the context (current working directory) of the host system when starting the build/run
    + Default: . (Current working directory)

#### Stage 1 (Base)
- `STAGE_1_IMAGE_NAME` : Set the target name of the image to build
    + Default: thanatisia/docker-ide
- `STAGE_1_IMAGE_TAG`  : Set the tag/version of the image to build
    + Default: latest
+ `STAGE_1_BUILD_ARGS` : Specify the build arguments to parse into the build process
- `STAGE_1_DOCKERFILE` : Specify the path to the custom Dockerfile to build
    + Default: 'docker/Dockerfiles/[base-distributions]/[language].Dockerfile'

#### Stage N (Multistaged build - Add-on Dockerfiles)
- `STAGE_2_IMAGE_NAME` : Set the target name of the image to build
    + Default: thanatisia/docker-ide
- `STAGE_2_IMAGE_TAG`  : Set the tag/version of the image to build
    + Default: [programming-language]
- `STAGE_2_BUILD_ARGS` : Specify the build arguments to parse into the build process
    - Default Values 
        + `--build-arg "USER_NAME=${USER}"`
        + `--build-arg "USER_PRIMARY_GROUP=wheel"`
        + `--build-arg "USER_SECONDARY_GROUPS=users"`
        + `--build-arg "USER_SHELL=/bin/bash"`
        + `--build-arg "USER_DEFAULT_HOME=${HOME}"`
        + `--build-arg "USER_OPTS=-m"`
- `STAGE_2_DOCKERFILE` : Specify the path to the custom Dockerfile to build
    + Default: 'docker/Dockerfiles/stage-2/user-mgmt.Dockerfile'

#### Containers
- `CONTAINER_IMAGE_NAME` : Specify the docker image to startup the container with
    + Default: thanatisia/docker-ide
- `CONTAINER_IMAGE_TAG` : Specify the tag/version of the docker image you selected to startup the container with
    + Default: [programming-language]
- `CONTAINER_NAME` : Specify the name of the container to startup
    + Default: dev-env
- `CONTAINER_OPTS` : Specify all additional options to parse into the container startup process
    - Default Values:
        + `--restart=unless-stopped`
        + `--workdir=/src`
    - Other Options:
        + `--user=${USER}`
- `CONTAINER_PORT_FORWARDING` : Port Forward/Translate/Map from host system to container; `-p "[host-ip-address]:[host-system-port]:[container-port]"`
- `CONTAINER_MOUNT_VOLUMES`   : Mount Host System Volume; `-v "[host-system-volume]:[container-volume]:[permissions]"`
    - Default Values:
        + -v "${PWD}/src/:/src"
        + -v "${HOME}/.config/:${HOME}/.config/"
+ `CONTAINER_PASSTHROUGH_DEVICE` : Passthrough a device/bus file from the host system to the container; `--device "[host-system-device-file]:[container-mount-point]"`

### Instructions/Rules/Targets
+ help : Display Help message
+ build-stage-1 : Build Stage 1 image from multi-stage build
+ build-stage-N : Build Stage N image from multi-stage build
+ run : Startup a container from an image
+ enter : Chroot and enter the container
+ start : Start the container if stopped and exists
+ stop : Stop the container if running
+ restart : Restart the container if running
+ remove : Remove the container if exists
+ logs : Display logs of the container

### Usage
- Default Baseline
    - Explanation
        + -k : Keep executing even if error is encountered
    ```bash
    make -k stop remove build-stage-1 run enter
    ```

## Documentation

### Usage

### Project fileystem structure
- root/
    - README.md
    - docker-compose.yaml : Main docker-compose environment script/file
    - Makefile : Convenient make build file with targets/recipes to simplify running docker run
    - docs/ : Contains documentation folders
        + language-setup.md : Programming Language Development Environment setup documentation
    - docker/ : Contains docker-based resources/source files
        - Dockerfiles/ : Contains all docker image templates (Dockerfile)
            - archlinux/ : The base image distribution of the dockerfile image template; This is using ArchLinux
                + c.Dockerfile : Image Template for setting up a working C programming language development environment
    - src/ : This is the source directory that will be mounted into the container
        - c : This contains your C programming language source files

## Wiki

## Resources

## References

## Remarks

