# Stage 2 Post-setup Dockerfile image template for building Neovim to the base image (Change the base image name accordingly)
FROM thanatisia/docker-ide:archlinux AS neovim

# Set Arguments (Local Variables)

# Install packages
RUN pacman -S --noconfirm base-devel git cmake unzip ninja curl \
    && git clone https://github.com/neovim/neovim \
    && cd neovim \
    && make CMAKE_BUILD_TYPE=RelWithDebInfo -j4 \
    && make install

