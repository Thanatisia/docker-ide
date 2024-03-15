# Stage 2 Post-setup Dockerfile image template for installing essential packages to an IDE base image
FROM thanatisia/docker-ide:latest AS stage-2

# Set Arguments (Local Variables)

# Install packages
RUN apt install -y cmake \
    && git clone https://github.com/neovim/neovim \
    && cd neovim \
    && make -j4 \
    && make install


