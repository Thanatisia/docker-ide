# General Project Idea Development Environment setup documentation

## Information
### Description
+ Collection of Development Environment setup for general and Frequently-made project ideas

### Contribution
- When adding a new framework entry
    - Please follow the following format/structure
        ```
        ### [project-idea-name|type]
        #### Setup
        ##### Dependencies
        ##### Useful Tools
        #### System Environment
        #### Build process and compilation
        ```

## Entries
### Android Mobile Application Development
#### Setup
##### Dependencies
- System packages
    + bash 
    + git 
    + make 
    + Build Essentials (base-devel, build-essential, alpine-sdk etc etc)
    + shadow 
    + sudo 
    + curl 
    + unzip 
    + nodejs 
    + npm 
    + gradle
    + jdk

##### Pre-Requisites
- Set Environment Variables
    + ANDROID_HOME="/usr/lib/android-sdk"
    + ANDROID_USER_HOME="$HOME/.config/android"
    + ANDROID_EMULATOR_HOME="${ANDROID_USER_HOME}/emulator"
    + ANDROID_AVD_HOME="${ANDROID_EMULATOR_HOME}/avd"
    + PATH="${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/cmdline-tools/latest/bin:/path/to/gradle:/your/other/paths:"

##### Useful Tools

#### System Environment
- Download and extract Android SDK Tools
    - Download the Android SDK Tools
        ```bash
        wget "https://dl.google.com/android/repository/sdk-tools-linux-[version].zip" -O /tmp/tools.zip
        ```
    - Create your '$ANDROID_HOME' directory
        ```bash
        mkdir -pv ${ANDROID_HOME}/
        ```
    - Unzip the package 
        ```bash 
        unzip /tmp/tools.zip -d ${ANDROID_HOME}
        ```
    - Remove the package zip
        ```bash
        rm -v /tmp/tools.zip
        ```

- Download and extract Android Command line Tools
    - Download the Android Command Line Tools
        ```bash
        wget "https://dl.google.com/android/repository/commandlinetools-linux-[version]_latest.zip" -O /tmp/cmdlinetools.zip
        ```
    - Create your '$ANDROID_HOME' directory
        ```bash
        mkdir -pv ${ANDROID_HOME}/cmdline-tools
        ```
    - Unzip the package 
        ```bash 
        unzip /tmp/cmdlinetools.zip -d ${ANDROID_HOME}/cmdline-tools
        ```
    - Rename 'cmdline-tools/cmdline-tools' to 'cmdline-tools/latest'
        ```bash
        mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools/ ${ANDROID_HOME}/cmdline-tools/latest/
        ```
    - Accept Android SDK licenses
        ```bash 
        yes | ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --licenses
        ```
    - Remove the package zip
        ```bash
        rm -v /tmp/cmdlinetools.zip
        ```

- Install Android SDK packages
    ```bash
    sdkmanager ${ANDROID_SDK_PACKAGES}
    ```

#### Build Process and Compilation

## Wiki

## Resources

## References

## Remarks

