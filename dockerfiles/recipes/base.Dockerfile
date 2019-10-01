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


RUN echo "Rebuild on Jan 16, 2019, v1"
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

# RUN git clone https://github.com/facebook/watchman.git
# WORKDIR /root/watchman
# RUN ./autogen.sh
# RUN ./configure
# RUN make && make install

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

WORKDIR /root

# Fix for spacemacs org-mode. It will be reinstalled at next startup 
# Unfortunately, this will give an error on org-projectile (only at the first start)
RUN rm -rf /root/.emacs.d/elpa/org-*
