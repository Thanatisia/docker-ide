# Stage 2 Post-setup Dockerfile image template for installing essential packages to an IDE base image
FROM thanatisia/docker-ide:debian AS stage-2

# Set Arguments (Local Variables)

# Install packages
RUN apt install -y clang gcc ninja-build gettext cmake unzip curl build-essential \
    && git clone https://github.com/neovim/neovim \
    && cd neovim \
    && make CMAKE_BUILD_TYPE=RelWithDebInfo -j4 \
    && make install


