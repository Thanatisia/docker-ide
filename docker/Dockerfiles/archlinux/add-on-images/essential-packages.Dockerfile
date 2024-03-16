# Stage 2 Post-setup Dockerfile image template for installing essential packages to an IDE base image
FROM thanatisia/docker-ide:archlinux AS stage-2

# Set Arguments (Local Variables)

# Install packages
RUN pacman -S neovim

