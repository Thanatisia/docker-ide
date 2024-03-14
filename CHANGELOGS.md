# CHANGELOGS

## Table of Contents
+ [2024-03-14](#2024-03-14)

## Entry Logs
### 2024-03-14
#### 0907H
+ Initial Commit

- New
    + Added new document 'README.md'
    + Added new docker-compose file 'docker-compose.yaml'
    - Added new directory 'docker/' for all docker-based files 
        - Added new directory 'Dockerfiles/' for all docker image template files 
            + Added new Dockerfile 'c.Dockerfile' for C programming language development environment
    - Added new directory 'docs/' for all Documentations 
        + Added new document 'language-setup.md' containing fundamental setup requirements for programming languages, frameworks and development environemnt necessities (i.e. C dependencies, useful tools and build steps)

#### 0946H
- New
    - Created new directory 'archlinux' in 'docker/Dockerfiles' to create a new layer in the project structure for Base Distribution Images, providing customizability to the development environment (i.e. different package managers, distribution support)
    - Added new Makefile for convenient usage of docker run

- Updates
    - Migrated 'docker/Dockerfiles/c.Dockerfile' => 'docker/Dockerfiles/archlinux'
    - Updated document 'README.md'
        + Added option for '-w | --workdir' to set the current working directory in the container
        + Updated project filesystems structure with new directories
    - Updated document 'docker-compose.yaml'
        + Added '--stdin_open=true', 'tty=true' and 'working_dir=/src' to dockerfile options

#### 1016H
- New
    - Added new directory 'debian' in 'docker/Dockerfiles' for Debian-based dockerfiles
        + Added new Dockerfile 'c.Dockerfile' in for C programming language development environment
    - Added new directory 'alpine' in 'docker/Dockerfiles' for Debian-based dockerfiles
        + Added new Dockerfile 'c.Dockerfile' in for C programming language development environment
- Updates
    - Updated 'Makefile'
        + Set 'STAGE_1_DOCKERFILE' to a default generalized value
    - Updated dockerfile 'c.Dockerfile' in 'docker/Dockerfiles/archlinux'
        + Added vim (This is your text editor)

#### 1240H
- New
    - Added new directory 'stage-2' in 'docker/Dockerfiles' for holding Stage 2 add-on Dockerfile 'patches' designed to be built on top of the base (stage-1) IDE images
        - Added new Dockerfile 'user-mgmt.Dockerfile'
            + Uses the built image 'thanatisia/docker-ide:latest' by default, you can change this to what you need
            + Contains arguments (local variables) for the user information to create
            + Contains a RUN instruction to create a new user when built on top of the base image

- Updates
    - Updated document 'README.md'
        + Added documentations for the Makefile
    - Updated 'Makefile'
        + Added default build arguments for user management
        + Added useful default container options 
        + Added useful default volume mounts (i.e. user configuration folder mount)
        + Added new target/recipe 'enter' to chroot into the container on run
        + Prepended 'IMAGE_NAME', 'IMAGE_TAG' and 'BUILD_ARGS' with 'STAGE_1_' to distinctly separate the staged build information (by default, its only the base stage (stage 1))
        + Added 'STAGE_2_*' variables for multistage add-on Dockerfiles
    - Updated Dockerfile 'c.Dockerfile' in 'docker/Dockerfiles/alpine'
        + Added new dependencies
    - Updated document 'docker-compose.yaml'
        - Updated image name to be constant with the documentation
            + Previously the target image name is 'c'
        + Updated container name
        + Updated Dockerfile path

#### 1415H
- Updates
    - Updated 'Makefile'
        + Changed 'CONTAINER_NAME' to be consistent with docker-compose

#### 1430H
- New
    - Added new document 'customization.md' in 'docs/' with documentation on customizing your docker-based IDE

#### 1457H
- Updates
    - Updated 'README.md'
        - Renamed all occurences of 'src/' to 'projects/'
            + Reasoning: Scalability, 'src' is generally referring to source codes and source files within a project
    - Updated 'Makefile'
        - Renamed all occurences of 'src/' to 'projects/'
            + Reasoning: Scalability, 'src' is generally referring to source codes and source files within a project

#### 1516H
- Updates
    - Updated 'README.md'
        + Added more information to 'CONTAINER_IMAGE_TAG'
        + Added the instructions for usage and implementation of multi-staged builds

#### 1540H
- Updates
    - Updated 'customization.md' in 'docs/'
        + Added notes and warnings pertaining to volume mounting order

#### 1629H
- New
    + Added new directory 'agnostic/' in 'docker/Dockerfiles' for all non-Operating System/distribution-specific patch Dockerfiles
    - Added new directory 'add-on-images/' in 'docker/Dockerfiles/alpine' for all alpine-related patch Dockerfiles
        + Added new Dockerfile 'essential-packages.Dockerfile' that will install essentials into the base IDE image of your choice
    - Added new directory 'add-on-images/' in 'docker/Dockerfiles/archlinux' for all archlinux-related patch Dockerfiles
        + Added new Dockerfile 'essential-packages.Dockerfile' that will install essentials into the base IDE image of your choice
    - Added new directory 'add-on-images/' in 'docker/Dockerfiles/debian' for all debian-related patch Dockerfiles
        + Added new Dockerfile 'essential-packages.Dockerfile' that will install essentials into the base IDE image of your choice
    + Added new directory 'programming-languages/' in 'docker/Dockerfiles/alpine' to hold the docker image templates for all Programming Languages development environments; This is using alpine as the package management backend
    + Added new directory 'programming-languages/' in 'docker/Dockerfiles/archlinux' to hold the docker image templates for all Programming Languages development environments; This is using archlinux as the package management backend
    + Added new directory 'programming-languages/' in 'docker/Dockerfiles/debian' to hold the docker image templates for all Programming Languages development environments; This is using debian as the package management backend

- Updates
    + Migrated dockerfile 'user-mgmt.Dockerfile' from 'docker/Dockerfiles/stage-2/' => 'docker/Dockerfiles/agnostic/'
    + Migrated dockerfile 'c.Dockerfile' from 'docker/Dockerfiles/alpine/' => 'docker/Dockerfiles/alpine/programming-languages/'
    + Migrated dockerfile 'c.Dockerfile' from 'docker/Dockerfiles/archlinux/' => 'docker/Dockerfiles/archlinux/programming-languages/'
    + Migrated dockerfile 'c.Dockerfile' from 'docker/Dockerfiles/debian/' => 'docker/Dockerfiles/debian/programming-languages/'


