
ARG VARIANT="latest"
FROM docker.io/archlinux/archlinux:$VARIANT

# Initialize pacman keyring and upgrade system
RUN pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Sy --needed --noconfirm --disable-download-timeout archlinux-keyring && \
    pacman -Su --noconfirm --disable-download-timeout

RUN pacman -S --noconfirm \
    fish \
    starship \
    bat \
    neovim \
    exa \
    git \
    nodejs \
    npm \
    openssh \
    yarn 

RUN groupadd -g 1000 t
RUN useradd -u 1000 -g 1000 -m -s /usr/bin/fish t
USER t
RUN mkdir /home/t/dotfiles
