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

### Quickstart
#### Creating a simple Development Environment
- Using Makefile
    + Configure the following Makefile environment variables
    - Stop all running containers, Remove containers
        ```bash
        make -k stop remove
        ```
    - Build your base (stage 1) IDE docker image
        ```bash
        make build-stage-1
        ```
    - (Optional) Build all following stages 2 to N on top of your stage 1 docker image (Development Environment)
        - Notes
            + Ensure that you add build-stage-{3..N} manually at the current time because the Makefile at the moment only contains specifications for build stages 1 and 2
        ```bash
        make build-stage-2 build-stage-3 ... build-stage-N
        ```
    - Startup and run a new container using a target built image
        ```bash
        make run
        ```
    - Chroot and enter contaimer
        ```bash
        make enter
        ```

- Using docker run
    - Build your base (stage 1) IDE docker image
        ```bash
        docker build --tag=thanatisia/docker-ide:latest \
                     -f docker/Dockerfiles/[base-distribution]/programming-languages/[language].Dockerfile \
                     .
        ```
    - (Optional) Build all following stages 2 to N on top of your stage 1 docker image (Development Environment)
        - Additional patch docker image templates (Dockerfiles)
            ```bash
            docker build --tag=[author]/docker-ide:[tag|version] \
                         -f docker/Dockerfiles/[base-distribution]/add-on-images/[patch-name].Dockerfile \
                         .
            ```
        - Frameworks
            ```bash
            docker build --tag=[author]/docker-ide:[tag|version] \
                         -f docker/Dockerfiles/[base-distribution]/frameworks/[framework].Dockerfile \
                         .
            ```
    - Startup and run a new container using a target built image
        ```bash
        docker run -itd \
            --name=[container-name] \
            --restart=unless-stopped \
            --workdir="/projects" \
            -v "${PWD}/projects:/projects" \
            -v "${HOME}/.config/:${HOME}/.config/" \
            [author-name]/docker-ide:[tag|version]
        ```
    - Chroot and enter contaimer
        ```bash
        docker exec -it [container-name] [shell]
        ```

- (Optional) Add an alias mapping to the container's shell into your shell's resource control (rc) file for easy access
    - Notes
        + Useful for quick access to the development environment
    ```bash
    alias enter_dev_env="docker exec -it [your-container-name] $SHELL"
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
- `CONTAINER_IMAGE_TAG` : Specify the tag/version of the docker image you selected to startup the container with; Change this to switch between image versions if you are using multi-stage builds
    + Default: [programming-language]
- `CONTAINER_NAME` : Specify the name of the container to startup
    + Default: dev-env
- `CONTAINER_OPTS` : Specify all additional options to parse into the container startup process
    - Default Values:
        + `--restart=unless-stopped`
        + `--workdir=/projects`
    - Other Options:
        + `--user=${USER}`
- `CONTAINER_PORT_FORWARDING` : Port Forward/Translate/Map from host system to container; `-p "[host-ip-address]:[host-system-port]:[container-port]"`
- `CONTAINER_MOUNT_VOLUMES`   : Mount Host System Volume; `-v "[host-system-volume]:[container-volume]:[permissions]"`
    - Default Values:
        + -v "${PWD}/projects/:/projects"
        + -v "${HOME}/.config/:${HOME}/.config/"
+ `CONTAINER_PASSTHROUGH_DEVICE` : Passthrough a device/bus file from the host system to the container; `--device "[host-system-device-file]:[container-mount-point]"`

#### Remote Server Connection
+ `SERVER_USER_NAME` : Set the username of the server hosting the docker container instance you wish to connect to
+ `SERVER_IP_ADDRESS`  : Set the IP address of the server hosting the docker instance you wish to access
- `SERVER_SHELL` : Set the shell to use to access the interactive tty of the container  
    + Default: /bin/bash

### Instructions/Rules/Targets
+ help : Display Help message
+ build-stage-1 : Build Stage 1 image from multi-stage build
+ build-stage-N : Build Stage N image from multi-stage build
+ run : Startup a container from an image
+ enter : Chroot and enter the container
+ ssh : SSH and connect to the container from a remote host
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

- Multi-stage Build
    - Explanation
        + the makefile will perform a docker build on the specified stage 1 Dockerfile (docker image template file) to build a stage 1 base image. Generally, this will be your primary IDE at its core 
        - then, makefile will build the stage 2 dockerfile templates that is built on top of the stage 1 images, followed by stage 3, which is built on top of stage 2
            + This process will continue until the building of the stage N template which is based on the stage (N-1) Dockerfile
            + On completion, the final product of the multi-staged build will be a docker image/environment with the features added by all the stages stacked on top of the Base (stage 1) Image
    ```bash
    make build-stage-1 build-stage-2 ... build-stage-N
    ```

- Connect and chroot to a remote docker server/session/instance
    ```bash
    SERVER_USER_NAME=[your-target-username] \
    SERVER_IP_ADDRESS=[your-target-server-ip|domain] \
    SERVER_SHELL=[your-target-shell (default: /bin/bash)] \
    make ssh
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
    - projects/ : This is the source directory that will be mounted into the container containing all your applications and projects
        - c : This contains your C programming language source files

## Wiki

## Resources

## References

## Remarks

