FROM    ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/zsh
ENTRYPOINT /bin/zsh

RUN apt-get update && apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update 

RUN apt-get install -y \
    curl \
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


RUN echo "Reload n. 3"
RUN git clone https://github.com/vzaccaria/dotfiles.git /root/dotfiles
WORKDIR /root/dotfiles/zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles/zprezto/.zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles
RUN stow zprezto 
RUN stow osx-tmux

WORKDIR /root
RUN  git clone https://github.com/powerline/fonts.git /root/fonts --depth=1
WORKDIR /root/fonts
RUN  ./install.sh

WORKDIR /root
RUN wget -c https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
RUN unzip exa-linux-x86_64-0.8.0.zip
RUN mv exa-linux-x86_64 /usr/local/bin/exa


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




RUN add-apt-repository -y ppa:neovim-ppa/stable
RUN apt-get install -y python-software-properties
RUN apt-get update 
RUN apt-get install -y neovim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
WORKDIR /root/dotfiles
RUN stow neovim
RUN mkdir -p /root/.config/nvim
COPY scripts/init.vim /root/.config/nvim

RUN apt-get install -y python-dev python-pip python3-dev
RUN apt-get install -y python3-setuptools
RUN easy_install3 pip
RUN pip3 install pynvim
RUN nvim +PlugUpdate +qall


RUN curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin ; exit 0
RUN git clone --depth 1 https://github.com/harfbuzz/harfbuzz.git /tmp/harfbuzz
WORKDIR /tmp/harfbuzz/ 
RUN ./autogen.sh && ./configure && make
RUN mkdir -p /root/.local/kitty.app/lib
RUN cp src/.libs/libharfbuzz.so ~/.local/kitty.app/lib/libharfbuzz.so.0
RUN mkdir -p ~/.local/bin
RUN ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/

RUN echo "Reload n. 29/4 10:30"
WORKDIR /root/dotfiles
RUN git fetch && git pull 

