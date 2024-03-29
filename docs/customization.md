# Customizing your Docker-based Development Environment

```
Tips and Tricks for customizing your IDE before and after starting up your container
```

## Notes
- When mounting volumes, please take note of the volume mount order
    - The volume mounting process is iterative, this means that there may be directory conflict if a directory is mounted before/after another intended directory
        - i.e.
            - Mounting '$HOME/.config' before '$HOME'
                + by mounting the .config folder befor the root, the root will overwrite the mounted configuration and the filesystem will become confused
- If you encountered a read permission error with a file created by the container after mounting
    - Change the permission of the profiles folder to '755'
        ```bash
        sudo chmod 755 -R [profiles-directory]
        ```

## Customization
### Before starting up the container
- Prepare to synchronize the container's files to the host system
    - Create profile directories to store your container's profile configuration files (aka dotfiles)
        - Common directories you want to synchronize between the host system and the container
            - Home directory : The home directory is your primary userspace directory that contains information for each user, you want to keep this
                + '/root' for root users, 
                + $HOME if you are logged in/using container as a defined user
        ```bash
        mkdir -pv /path/to/profile
        ```

    - Mount the created profile directories in your docker run command/docker-compose configuration file
        - docker run
            - Root user
                ```bash
                docker run -itd --name=[container-name] --restart=unless-stopped -v "/path/to/profile/root:/root"
                ```
            - Defined user (either created, or using the USER instruction in Dockerfile)
                ```bash
                docker run -itd --name=[container-name] --restart=unless-stopped -v "/path/to/profile/user:${HOME}"
                ```
        - docker-compose.yaml
            - Root user
                ```yaml
                version: "3.7"
                services:
                    service-name:
                        image: author/image:tag
                        container_name: container-name
                        volumes:
                            - "/path/to/profile/root:/root"
                ```
            - Defined user
                ```yaml
                version: "3.7"
                services:
                    service-name:
                        image: author/image:tag
                        container_name: container-name
                        volumes:
                            - "/path/to/profile/user:/${HOME}"
                ```

### After starting up the container


## Wiki

## Resources

## References

## Remarks

