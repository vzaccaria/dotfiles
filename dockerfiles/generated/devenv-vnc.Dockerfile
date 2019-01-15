FROM    ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/zsh
ENTRYPOINT /bin/zsh

RUN echo "Rebuild on Jan 30, 2018, v0"

RUN apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash ./nodesource_setup.sh

RUN apt-get install -y \
    wget \
    zsh \
    stow \
    git \
    libglu1-mesa \
    ispell \
    screen \
    silversearcher-ag \
    software-properties-common \
    llvm-3.5 \
    llvm-3.5-dev \
    clang-3.5 \
    tmux \
    unzip \
    nodejs \
    build-essential \
    autoconf \
    automake \
    python-dev \
    libtool \
    pkg-config \
    libssl-dev \
    vim

RUN add-apt-repository -y ppa:kelleyk/emacs
RUN apt-get update
RUN apt-get install -y emacs25

RUN echo "Rebuild on Jan 23, 2018, v3"
RUN add-apt-repository -y ppa:cpick/hub
RUN apt-get update
RUN apt-get install -y hub
RUN hub config --global hub.protocol https


RUN echo "Rebuild on Jan 16, 2019, v0"
RUN git clone https://github.com/vzaccaria/dotfiles.git /root/dotfiles
WORKDIR /root/dotfiles

RUN git clone https://github.com/syl20bnr/spacemacs /root/.emacs.d
RUN cd /root/.emacs.d && git checkout tags/v0.200.13

WORKDIR /root/dotfiles/zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles/zprezto/.zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles

RUN stow zprezto linux-tmux spacemacs

WORKDIR /root

# ADD https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip /tmp/scp.zip
ADD http://www.ffonts.net/NanumGothic.font.zip /tmp/ng.zip

RUN mkdir -p /usr/local/share/fonts               && \
    unzip /tmp/ng.zip -d /usr/local/share/fonts   && \
    chown ${uid}:${gid} -R /usr/local/share/fonts && \
    chmod 777 -R /usr/local/share/fonts           && \
    fc-cache -fv                                  && \
    npm install -g tern js-beautify && \
    git config --global user.email "vittorio.zaccaria@gmail.com" && \
    git config --global user.name "Vittorio Zaccaria"

RUN git clone https://github.com/facebook/watchman.git
WORKDIR /root/watchman
RUN ./autogen.sh
RUN ./configure
RUN make && make install

RUN echo "Rebuild on Jan 30, 2019, v0"
RUN emacs --insecure -nw -batch -u "${UNAME}" -q -kill; exit 0
RUN emacs --insecure -nw -batch -u "${UNAME}" -q -kill; exit 0

RUN apt-get update && \
  apt-get install -y openssh-server \
  x11-apps

RUN echo "Rebuild on Jan 30, 2019, v1"
RUN mkdir -p /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/^#AllowTcpForwarding\s+.*/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/^#X11Forwarding\s+.*/X11Forwarding yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/^#X11UseLocalhost\s+.*/X11UseLocalhost no/g' /etc/ssh/sshd_config


RUN  git clone https://github.com/powerline/fonts.git /root/fonts --depth=1
WORKDIR /root/fonts
RUN  ./install.sh
WORKDIR /root

RUN apt-get install -y rxvt-unicode
WORKDIR /root/dotfiles
RUN stow -D linux-tmux
RUN stow osx-tmux

RUN git clone https://github.com/vzaccaria/vz-clitools.git /root/clitools
WORKDIR /root/clitools
RUN npm link .

# Fix for spacemacs org-mode. This will give an error on org-projectile only at the first start
RUN rm -rf .emacs.d/elpa/org-*^
RUN \
    apt-get update && \
    apt-get install -y \
            lxde ttf-dejavu \
            x11-utils \
            libfontenc1 \
            libtasn1-3-bin \
            libxfont1 \
            x11-xkb-utils && \
    apt-get remove vnc4server -y && \
    wget -O tigervnc.deb "https://bintray.com/tigervnc/stable/download_file?file_path=ubuntu-16.04LTS%2Famd64%2Ftigervncserver_1.7.0-1ubuntu1_amd64.deb" && \
    dpkg -i tigervnc.deb && \
    apt install -f -y && \
    rm tigervnc.deb

WORKDIR /root
COPY scripts/startx ./

RUN mkdir Desktop .vnc && \
	  echo "startlxde" > .vnc/xstartup && \
    chmod +x startx .vnc/xstartup
RUN apt-get install -y expect
CMD ["/root/startx"]

WORKDIR /root/dotfiles
RUN stow urxvt

WORKDIR /root
RUN apt-get install -y terminator dmenu

RUN mkdir -p temp
WORKDIR /root/temp
RUN git clone https://www.github.com/Airblader/i3 i3-gaps
WORKDIR /root/temp/i3-gaps
RUN autoreconf --force --install
RUN mkdir -p build
WORKDIR /root/temp/i3-gaps/build

RUN add-apt-repository -y ppa:aguignard/ppa
RUN apt-get update
RUN apt-get install -y libxcb-xrm-dev

RUN apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
  libstartup-notification0-dev libxcb-randr0-dev \
  libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
  libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
  autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev feh

RUN ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
RUN make
RUN make install

WORKDIR /root/dotfiles
RUN stow i3
WORKDIR /root
RUN echo "i3" > .vnc/xstartup
RUN chmod +x .vnc/xstartup
RUN apt-get install -y i3status

RUN sed -ri 's/Mod4/Mod1/' /root/.i3/config


