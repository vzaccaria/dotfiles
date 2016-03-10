FROM    ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget \
    zsh \
    stow \
    git

WORKDIR /root
RUN git clone https://github.com/vzaccaria/dotfiles.git
WORKDIR /root/dotfiles/zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles/zprezto/.zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles
RUN stow zprezto
WORKDIR /root
ENTRYPOINT /bin/zsh
