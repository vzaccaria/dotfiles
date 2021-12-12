FROM    ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/zsh
ENTRYPOINT /bin/zsh

RUN apt-get update && apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y \
    curl \ 
    git \ 
    zsh \
    tigervnc-standalone-server \
    tigervnc-common \ 
    lxde \ 
    ttf-dejavu


RUN apt-get install -y expect



RUN addgroup --system nixbld && \
  adduser --home /home/nix --disabled-password --gecos "" --shell /bin/bash nix && \
  adduser nix nixbld && \
  mkdir -m 0755 /nix && chown nix /nix && \
  mkdir -p /etc/nix && echo 'sandbox = false' > /etc/nix/nix.conf

USER nix
ENV USER nix
WORKDIR /home/nix

RUN curl -L https://nixos.org/nix/install | sh

COPY scripts/startx ./
USER root 
RUN chown nix /home/nix/startx
USER nix

RUN mkdir Desktop .vnc && \
    echo "startlxde" > .vnc/xstartup 

RUN git clone https://github.com/vzaccaria/filesdot.git
WORKDIR /home/nix/filesdot 
RUN /bin/bash -c ./install.sh

# WORKDIR /root/dotfiles
# RUN stow urxvt

# WORKDIR /root
# RUN apt-get install -y terminator dmenu

# RUN mkdir -p temp
# WORKDIR /root/temp
# RUN git clone https://www.github.com/Airblader/i3 i3-gaps
# WORKDIR /root/temp/i3-gaps
# RUN autoreconf --force --install
# RUN mkdir -p build
# WORKDIR /root/temp/i3-gaps/build

# RUN add-apt-repository -y ppa:aguignard/ppa
# RUN apt-get update
# RUN apt-get install -y libxcb-xrm-dev

# RUN apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
#   libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
#   libstartup-notification0-dev libxcb-randr0-dev \
#   libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
#   libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
#   autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev feh

# RUN ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
# RUN make
# RUN make install

# WORKDIR /root/dotfiles
# RUN stow i3
# WORKDIR /root
# RUN echo "i3" > .vnc/xstartup
# RUN chmod +x .vnc/xstartup
# RUN apt-get install -y i3status




