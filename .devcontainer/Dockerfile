
ARG VARIANT="base-devel"
FROM docker.io/archlinux:$VARIANT

RUN pacman -Sy --noconfirm \
    fish \
    starship \
    bat \
    neovim \
    exa \
    git \
    nodejs \
    npm \
    yarn 

RUN groupadd -g 1000 t
RUN useradd -u 1000 -g 1000 -m -s /usr/bin/fish t
USER t
RUN mkdir /home/t/dotfiles
WORKDIR /home/t/dotfiles
