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


RUN echo "Reload n. 1"
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



RUN apt-get install -y autoconf automake autotools-dev curl \
    libmpc-dev libmpfr-dev libgmp-dev gawk build-essential \
    bison flex texinfo gperf libtool patchutils bc zlib1g-dev
WORKDIR /root
RUN git clone https://github.com/riscv/riscv-gnu-toolchain.git
WORKDIR /root/riscv-gnu-toolchain
RUN git submodule update --init --recursive
RUN ./configure --prefix=/opt/riscv/toolchain --with-arch=rv32g --with-abi=ilp32d
RUN make
RUN make install
WORKDIR /root
RUN git clone https://github.com/rv8-io/rv8.git
WORKDIR /root/rv8
RUN git submodule update --init --recursive
RUN make
RUN make install
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
RUN nvim +PluginInstall +qall


