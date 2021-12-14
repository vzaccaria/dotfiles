FROM    ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update 

RUN apt-get install -y \
    curl \ 
    git \ 
    tigervnc-standalone-server \
    tigervnc-common \ 
    lxde \ 
    i3 \
    expect \
    ttf-dejavu


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

RUN /home/nix/.nix-profile/bin/nix-channel --add https://nixos.org/channels/nixos-21.05 nixpkgs
RUN /home/nix/.nix-profile/bin/nix-channel --update

RUN /usr/bin/bash ./install.sh 

ENV POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD true


WORKDIR /home/nix
RUN chmod +x ./startx
RUN echo "i3" > .vnc/xstartup 
RUN mkdir /home/nix/.i3
USER root 
RUN apt-get install -y terminator dmenu
USER nix
COPY scripts/i3-config /home/nix/.i3/config
# WORKDIR /root/dotfiles
# RUN stow urxvt

# WORKDIR /root

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




