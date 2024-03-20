# CHANGELOGS

## Table of Contents
+ [2024-03-14](#2024-03-14)
+ [2024-03-15](#2024-03-15)
+ [2024-03-16](#2024-03-16)
+ [2024-03-18](#2024-03-18)
+ [2024-03-19](#2024-03-19)
+ [2024-03-20](#2024-03-20)

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

#### 1659H
- Updates
    - Updated 'customization.md' in 'docs/'
        + Added example solution for bug/error: file created by container not readable on exit

#### 2201H
- Updates
    - Updated 'Makefile'
        + Added target 'ssh' to ssh into the container (Trial - For security reasons, the template will not have any defaults)

### 2024-03-15
#### 1058H
- Updates
    - Updated document 'README.md'
        + Added documentations on the new 'ssh' target and dependent network/security-related variables

#### 1343H
- Updates
    - Updated Dockerfile 'essential-packages.Dockerfile' in 'docker/Dockerfiles/debian'
        + Fixed neovim dependencies when building Neovim from source in a Debian environment

#### 1446H
- New
    - Added new (temporary - testing for long term usefulness) dockerfile dedicated for Building Neovim from source 'neovim.Dockerfile' in 'docker/Dockerfiles/debian/add-on-images/'

#### 1355H
- Updates
    - Updated Dockerfile 'nvim.Dockerfile' in 'docker/Dockerfiles/debian/add-on-images/'
        + Fixed dependencies

#### 1455H
- New
    + Added new (temporary - testing for long term usefulness) dockerfile dedicated for Building Neovim from source 'neovim.Dockerfile' in 'docker/Dockerfiles/alpine/add-on-images/'
    + Added new (temporary - testing for long term usefulness) dockerfile dedicated for Building Neovim from source 'neovim.Dockerfile' in 'docker/Dockerfiles/archlinux/add-on-images/'

- Updates
    - Updated document 'README.md'
        + Added Quickstart reference steps to drop in and use it

#### 1527H
- New
    + Added new document 'framework-setup.md' in 'docs/' : Documentation of setting up of development environments for Framework and Library application development
    + Added new document 'project-environment-setup.md' in 'docs/' : Documentation of setting up of development environments for Frequently-made project ideas
- Updates
    - Updated document 'README.md'
        - Added optional step to Quickstart 
            + Add an alias mapping to docker exec into the docker container

### 2024-03-16
#### 1012H
- New
    - Added new Dockerfiles to 'docker/Dockerfiles/alpine/programming-languages/'
        + python.Dockerfile : for Python programming language development environment
        + rust.Dockerfile   : for Rust programming language development environment
    - Added new directory 'makefiles' in 'docs/' for holding Makefile templates for easy access to some frequently-used development environment usages (programming language, frameworks etc)
        + c.Makefile    : for C programming language development environment
        + py.Makefile   : for Python programming language development environment
        + rust.Makefile : for Rust programming language development environment
    - Added new directory 'compose' in 'docker/' to hold all docker-compose template/example configuration files
        + Added new docker-compose file 'c.docker-compose.yaml' for starting up a C programming development environment via docker-compose
        + Added new docker-compose file 'python.docker-compose.yaml' for starting up a Python scripting/programming development environment via docker-compose
        + Added new docker-compose file 'rust.docker-compose.yaml' for starting up a Rust programming development environment via docker-compose

- Updates
    - Updated document 'README.md'
        + Added pre-requisite steps when starting up using docker-compose
    - Updated Dockerfile 'c.Dockerfile' in 'docker/Dockerfiles/alpine/programming-languages/'
        + Added '--no-cache' to apk add to compress the image size

#### 2250H
- Updates
    - Updated docker-compose file 'c.docker-compose.yaml' in 'docker/compose/'
        + Removed the other service entries except c
    - Updated docker-compose file 'python.docker-compose.yaml' in 'docker/compose/'
        + Removed the other service entries except python
    - Updated docker-compose file 'rust.docker-compose.yaml' in 'docker/compose/'
        + Removed the other service entries except rust

#### 2257H
- Updates
    - Updated Makefile 'c.Makefile' in 'docs/makefiles'
        + Replaced 'alpine' to '[base-distributions]'
        + Replaced mount directory '/root' to '${HOME}'
    - Updated Makefile 'py.Makefile' in 'docs/makefiles'
        + Replaced 'alpine' to '[base-distributions]'
        + Replaced mount directory '/root' to '${HOME}'
    - Updated Makefile 'rust.Makefile' in 'docs/makefiles'
        + Replaced 'alpine' to '[base-distributions]'
        + Replaced mount directory '/root' to '${HOME}'

#### 2322H
- Updates
    - Updated main docker-compose file 'docker-comose.yaml'
        + Replaced mount directory '/root' to '${HOME}'

#### 2334H
- Updates
    - Updated document 'README.md'
        + Replaced tag/version 'latest' to the pseudovariable 'base-distributions' (to be replaced with the user's intended base distribution image)

#### 2338H
- Updates
    - Updated document 'README.md'
        + Added notes for the 'build' key-value in 'docker-compose.yaml'

### 2024-03-18
#### 1406H
- New
    - Added new directory 'environments' in 'docker/Dockerfiles/alpine/' : To hold Dockerfiles for setting up a generalized non-programming/framework project development environment
        + Added new Dockerfile 'android-development.Dockerfile': Docker image template file for building and setting up a proper Android Mobile Application Development Environment
    - Added new directory 'frameworks' in 'docker/Dockerfiles/alpine/' : To hold Dockerfiles for setting up framework and library application development environment
        + Added new Dockerfile 'react-native.Dockerfile': Docker image template file for building and setting up a proper React Native framework/library application development environment
    - Added new directory 'frameworks' in 'docs/makefiles/' for holding Makefile templates for easy access to some frequently-used framework/application development environment usages
        + react-native.Makefile : for building and managing React Native framework/library development environment docker image/container
- Updates
    - Updated document 'README.md'
        + Replaced 'Variables' with 'Build Argumnts'

#### 1524H
- Updates
    - Updated Dockerfile 'react-native.Dockerfile' in 'docker/Dockerfiles/alpine/'
        + Added new npm packages 'yarn' and 'react-native@latest'

#### 1547H
- Updates
    - Updated document 'framework-setup.md' in 'docs/'
        + Added new entry 'React Native'
    - Updated document 'project-environment-setup.md' in 'docs/'
        + Added new entry 'Android Mobile Application Development'

#### 1640H
- New
    + Added new docker-compose.yaml file 'react-native.docker-compose.yaml' in 'docker/compose' for starting up a React Native framework development environment via docker-compose

- Updates
    - Updated README.md
        + Added with information about android application development and react native files 
        + Updated filesystem structure

#### 1651H
- Updates
    - Updated 'docker-compose.yaml'
        + Added new example service 'react-native'

### 2024-03-19
#### 0931H
- New
    - Added new directory 'javascript' in 'docker/Dockerfiles/agnostic/'
        + Added new Dockerfile 'svelte.Dockerfile': Docker image template file for building and setting up a proper SvelteJS Web framework/library application development environment
        + Added new Dockerfile 'tailwind.Dockerfile': Docker image template file for building and setting up a proper Tailwind CSS Frontend framework/library application development environment
        + Added new Dockerfile 'vite.Dockerfile': Docker image template file for building and setting up a proper Vite framework/library application development environment
    + Added new document 'javascript.Dockerfile' in 'docker/Dockerfiles/alpine/programming-languages/': Docker image template file for building and setting up a proper (HTML5 + CSS3) Javascript Web Server Application Development Environment
    + Added new Makefile 'javascript.Makefile' in 'docs/makefiles/': for a Javascript Web Application development environment

- Updates
    - Updated Dockerfile 'user-mgmt.Dockerfile' in 'docker/Dockerfiles/agnostic/'
        + Replaced base image with build arguments 'BASE_IMAGE_NAME' and 'BASE_IMAGE_TAG'
    - Updated Dockerfile 'essential-packages.Dockerfile' in 'docker/Dockerfiles/alpine/add-on-images/'
        + Replaced base image with build arguments 'BASE_IMAGE_NAME' and 'BASE_IMAGE_TAG'
    - Updated Dockerfile 'nvim.Dockerfile' in 'docker/Dockerfiles/alpine/add-on-images/'
        + Replaced base image with build arguments 'BASE_IMAGE_NAME' and 'BASE_IMAGE_TAG'
    - Updated Dockerfile 'android-development.Dockerfile' in 'docker/Dockerfiles/alpine/environments/'
        + Replaced base image with build arguments 'BASE_IMAGE_NAME' and 'BASE_IMAGE_TAG'
    - Updated Dockerfile 'react-native.Dockerfile' in 'docker/Dockerfiles/alpine/frameworks/'
        + Replaced base image with build arguments 'BASE_IMAGE_NAME' and 'BASE_IMAGE_TAG'
    - Updated Dockerfile 'c.Dockerfile' in 'docker/Dockerfiles/alpine/programming-languages/'
        + Replaced base image with build arguments 'BASE_IMAGE_NAME' and 'BASE_IMAGE_TAG'
    - Updated Dockerfile 'python.Dockerfile' in 'docker/Dockerfiles/alpine/programming-languages/'
        + Replaced base image with build arguments 'BASE_IMAGE_NAME' and 'BASE_IMAGE_TAG'
    - Updated Dockerfile 'rust.Dockerfile' in 'docker/Dockerfiles/alpine/programming-languages/'
        + Replaced base image with build arguments 'BASE_IMAGE_NAME' and 'BASE_IMAGE_TAG'
    - Updated document 'Makefile'
        + Cleaned up and made the template more generic

#### 1511H
- Updates
    - Updated Dockerfile 'javascript.Dockerfile' in 'docker/Dockerfiles/alpine/programming-languages/'
        + Added new package 'npm'

#### 1602H
- Updates
    - Updated Dockerfile 'svelte.Dockerfile' in 'docker/Dockerfiles/agnostic/javascript/'
        + Added new dependenc(ies)
    - Updated Dockerfile 'vite.Dockerfile' in 'docker/Dockerfiles/agnostic/javascript/'
        + Added new dependenc(ies)
    - Updated document 'framework-setup.md' in 'docs/'
        + Added setup documentation for javascript frameworks 'Svelte' and 'Vite'

#### 2039H
- Updates
    - Updated document 'README.md'
        + Reorganized Build Arguments
    - Updated 'Makefile'
        + Shuffled 'CONTEXT' to the top

#### 2101H
- New
    + Added new document 'dockerfile-build-args.md' in 'docs/': To store all Build arguments in as many of the Dockerfiles as possible

#### 2110H
- Updates
    - Updated Dockerfile 'nvim.Dockerfile' in 'docs/Dockerfiles/alpine/add-on-images'
        + Added dependency 'git'
    - Updated Dockerfile 'nvim.Dockerfile' in 'docs/Dockerfiles/archlinux/add-on-images'
        + Added dependency 'git'
    - Updated Dockerfile 'nvim.Dockerfile' in 'docs/Dockerfiles/debian/add-on-images'
        + Added dependency 'git'

### 2024-03-20
#### 2053H
- New
    + Added new Dockerfile 'sveltekit.Dockerfile' in 'docker/Dockerfiles/agnostic/javascript/': Docker image template file for building and setting up a proper SvelteKit Fullstack Web framework/library application development environment

- Updates
    - Updated document 'framework-setup.md' in 'docs/'
        + Added new documentations for setting up SvelteKit

