# Framework and Library Development Environment setup documentation

## Information
### Contribution
- When adding a new framework entry
    - Please follow the following format/structure
        ```
        ### [Framework-Name]
        #### Setup
        ##### Dependencies
        ##### Useful Tools
        #### System Environment
        #### Build process and compilation
        ```

## Entries
### React Native
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

- NPM packages
    + yarn 
    + react-native@latest

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

### SvelteJS
#### Setup
##### Dependencies
+ node
+ npm
- npm packages
    + svelte@latest
    + create-svelte
##### Pre-Requisites
##### Useful Tools
#### System Environment
#### Build process and compilation
- Create a new project using a template
    - Explanation
        + This will use the 'create-svelte' package to generate a new project using svelte as the template
    ```bash
    npm create svelte@latest [project-name]
    ```

- Change directory into project
    ```bash
    cd [project-name]
    ```

- Install node package
    ```bash
    npm install
    ```

- To run the webserver
    ```bash
    npm run dev
    ```

### Vite
#### Setup
##### Dependencies
+ node
+ npm
- npm packages
    + vite@latest
    + create-vite
##### Pre-Requisites
##### Useful Tools
#### System Environment
#### Build process and compilation
- Create a new project using a template
    - SvelteJS
        - Explanation
            + This will use the 'create-vite' package to generate a new project using svelte as the template
        ```bash
        npm create vite@latest [project-name] -- --template svelte
        ```
    - Svelte Typescript
        - Explanation
            + This will use the 'create-vite' package to generate a new project using svelte (typescript) as the template
        ```bash
        npm create vite@latest [project-name] -- --template svelte-ts
        ```

- Change directory into project
    ```bash
    cd [project-name]
    ```

- Install node package
    ```bash
    npm install
    ```

- To run the webserver
    ```bash
    npm run dev
    ```

## Wiki

## Resources

## References

## Remarks

