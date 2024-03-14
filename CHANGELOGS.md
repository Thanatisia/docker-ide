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

