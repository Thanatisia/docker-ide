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

## Documentation

### Project fileystem structure
- root/
    - README.md
    - docker-compose.yaml
    - docs/ : Contains documentation folders
        + language-setup.md : Programming Language Development Environment setup documentation
    - docker/ : Contains docker-based resources/source files
        - Dockerfiles/ : Contains all docker image templates (Dockerfile)
            + c.Dockerfile : Image Template for setting up a working C programming language development environment
    - src/ : This is the source directory that will be mounted into the container
        - c : This contains your C programming language source files

## Wiki

## Resources

## References

## Remarks

