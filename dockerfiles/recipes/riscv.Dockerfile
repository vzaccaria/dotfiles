
RUN apt-get install -y autoconf automake autotools-dev curl \
    libmpc-dev libmpfr-dev libgmp-dev gawk build-essential \
    bison flex texinfo gperf libtool patchutils bc zlib1g-dev
WORKDIR /root
RUN git clone https://github.com/riscv/riscv-gnu-toolchain.git
WORKDIR /root/riscv-gnu-toolchain
RUN git submodule update --init --recursive
RUN ./configure --prefix=/opt/riscv/toolchain
RUN make
RUN make install
WORKDIR /root
RUN git clone https://github.com/rv8-io/rv8.git
WORKDIR /root/rv8
RUN git submodule update --init --recursive
RUN make
RUN make install
WORKDIR /root
RUN wget -c https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
RUN unzip exa-linux-x86_64-0.8.0.zip
RUN mv exa-linux-x86_64 /usr/local/bin/exa
RUN add-apt-repository -y ppa:neovim-ppa/stable
RUN apt-get update 
RUN apt-get install -y neovim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
WORKDIR /root/dotfiles
RUN stow neovim


