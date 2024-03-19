# Dockerfile image template for setting up a React Native framework integrated development environment (IDE)
FROM alpine:latest AS base

# Arguments and variables
ARG ANDROID_REPOSITORY="https://dl.google.com/android/repository/"
ARG ANDROID_CLI_TOOLS_PKG_NAME="commandlinetools"
ARG ANDROID_CLI_TOOLS_PLATFORM="linux"
ARG ANDROID_CLI_TOOLS_VERSION="7583922"
ARG ANDROID_SDK_TOOLS_PKG_NAME="sdk-tools"
ARG ANDROID_SDK_TOOLS_PLATFORM="linux"
ARG ANDROID_SDK_TOOLS_VERSION="4333796"
ARG SDK_TOOLS="4333796"
ARG BUILD_TOOLS="28.0.3"
ARG TARGET_SDK="28"
ARG ANDROID_SDK_PACKAGES="platform-tools cmdline-tools;latest"

# Environment Variables
ENV ANDROID_HOME "/usr/lib/android-sdk"
ENV ANDROID_USER_HOME "/usr/share/android"
ENV ANDROID_EMULATOR_HOME "${ANDROID_USER_HOME}/emulator"
ENV ANDROID_AVD_HOME "${ANDROID_EMULATOR_HOME}/avd"
ENV PATH "${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/cmdline-tools/latest/bin:"

# Update package manager database, Upgrade repository packages and Install dependencies
RUN apk update && apk upgrade \
    ## Install system packages
    && apk add --no-cache bash git make alpine-sdk shadow sudo coreutils curl unzip nodejs npm gradle \
    && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community openjdk21-jdk \
    ## Install NPM packages
    && npm install -g yarn react-native@latest

# Build external dependencies from Source
## Download and extract Android SDK Tools
RUN test -f /tmp/tools.zip || wget ${ANDROID_REPOSITORY}/${ANDROID_SDK_TOOLS_PKG_NAME}-${ANDROID_SDK_TOOLS_PLATFORM}-${ANDROID_SDK_TOOLS_VERSION}.zip -O /tmp/tools.zip \
    && mkdir -pv ${ANDROID_HOME} \
    && unzip /tmp/tools.zip -d ${ANDROID_HOME} \
    && rm -v /tmp/tools.zip \
## Download and extract Android Commandlinetools
    && test -f /tmp/cmdlinetools.zip || wget ${ANDROID_REPOSITORY}/${ANDROID_CLI_TOOLS_PKG_NAME}-${ANDROID_CLI_TOOLS_PLATFORM}-${ANDROID_CLI_TOOLS_VERSION}_latest.zip -O /tmp/cmdlinetools.zip \
    && mkdir -pv ${ANDROID_HOME}/cmdline-tools \
    && unzip /tmp/cmdlinetools.zip -d ${ANDROID_HOME}/cmdline-tools \
    && mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools/ ${ANDROID_HOME}/cmdline-tools/latest/ \
    && yes | ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --licenses \
    # Delete Android Command Line Tools
    && rm -v /tmp/cmdlinetools.zip \
## Install Android SDK packages
    && sdkmanager ${ANDROID_SDK_PACKAGES}

# Set Entry Point
ENTRYPOINT \
    ## $0 will take the executable's name (1st argument) \
    ## $@ will take all subsequent arguments (parameters) \
    ## Summary: \
    ## - argument [0] as the executable, and \
    ## - arguments [1:] as the parameters \
    exec "$0" "$@"

