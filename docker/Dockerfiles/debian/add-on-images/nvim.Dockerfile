# Stage 2 Post-setup Dockerfile image template for building Neovim to the base image (Change the base image name accordingly)
FROM thanatisia/docker-ide:latest AS neovim

# Set Arguments (Local Variables)

# Install packages
RUN apt install -y cmake \
    && git clone https://github.com/neovim/neovim \
    && cd neovim \
    && make -j4 \
    && make install

