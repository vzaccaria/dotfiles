FROM ubuntu:21.04


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get install -y \
    curl \ 
    git \ 
    tigervnc-standalone-server \
    tigervnc-common \ 
    lxde \ 
    i3 \
    expect 


WORKDIR /root
RUN mkdir Desktop .vnc && \
    echo "startlxde" > .vnc/xstartup && \ 
    chmod +x .vnc/xstartup

RUN echo "4" 
RUN git clone https://github.com/vzaccaria/filesdot.git
WORKDIR /root/filesdot 

RUN /usr/bin/bash ./install.sh 

ENV POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD true


WORKDIR /root
COPY scripts/startx .
RUN chmod +x ./startx
RUN echo "i3" > .vnc/xstartup 

RUN apt-get install -y terminator dmenu kitty npm

RUN mkdir /root/.i3
COPY scripts/i3-config /root/.i3/config

RUN mkdir -p /root/.config/kitty
COPY scripts/kitty.conf /root/.config/kitty
COPY scripts/gruvbox.conf /root/gruvbox.conf

CMD ["./startx"]



