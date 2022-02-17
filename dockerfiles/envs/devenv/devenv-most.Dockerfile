FROM ubuntu:21.04


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get install -y \
    curl \ 
    git \
    lsb-core


WORKDIR /root

RUN echo "4" 
RUN git clone https://github.com/vzaccaria/filesdot.git
WORKDIR /root/filesdot 

RUN /usr/bin/bash ./install.sh 

ENV POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD true


WORKDIR /root

RUN apt-get install -y npm clang libedit-dev libxml2-dev silversearcher-ag bison flex mpich


