FROM    ubuntu:trusty

RUN echo "Updated on July 23st, 2016"

ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/zsh
ENTRYPOINT /bin/zsh

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN bash ./nodesource_setup.sh

RUN apt-get install -y \
    wget \
    zsh \
    stow \
    git \
    emacs \
    libglu1-mesa \
    ispell \
    screen \
    silversearcher-ag \
    software-properties-common \
    llvm-3.5 \
    llvm-3.5-dev \
    clang-3.5 \
    tmux 


RUN apt-get install -y nodejs \
    build-essential

RUN apt-get build-dep -y emacs24
RUN mkdir -p /root/emacs
WORKDIR /root/emacs
RUN wget ftp.gnu.org/gnu/emacs/emacs-24.4.tar.xz
RUN tar -xf emacs-24.4.tar.xz
WORKDIR /root/emacs/emacs-24.4
RUN ./configure
RUN make install

RUN git clone https://github.com/vzaccaria/dotfiles.git /root/dotfiles
RUN git clone https://github.com/syl20bnr/spacemacs /root/.emacs.d

WORKDIR /root/dotfiles/zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles/zprezto/.zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles

RUN stow zprezto tmux-linux spacemacs-linux

WORKDIR /root

##-- Install Emacs
##

ENV PATH /usr/local/bin:$PATH
RUN emacs --insecure -nw -batch -u "${UNAME}" -q -kill
RUN emacs --insecure -nw -batch -u "${UNAME}" -q -kill


RUN npm install -g tern js-beautify


RUN git config --global user.email "vittorio.zaccaria@gmail.com"
RUN git config --global user.name "Vittorio Zaccaria"

# Fonts

ADD https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip /tmp/scp.zip
ADD http://www.ffonts.net/NanumGothic.font.zip /tmp/ng.zip

RUN apt-get install -y unzip
RUN mkdir -p /usr/local/share/fonts               && \
    unzip /tmp/scp.zip -d /usr/local/share/fonts  && \
    unzip /tmp/ng.zip -d /usr/local/share/fonts   && \
    chown ${uid}:${gid} -R /usr/local/share/fonts && \
    chmod 777 -R /usr/local/share/fonts           && \
    fc-cache -fv

RUN apt-get install -y vim

RUN mkdir -p /root/modelsim
WORKDIR /root/modelsim
RUN wget http://download.altera.com/akdlm/software/acdsinst/13.1/162/ib_installers/ModelSimSetup-13.1.0.162.run
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y build-essential gcc-multilib g++-multilib \
	lib32z1 lib32stdc++6 lib32gcc1 \
	expat:i386 fontconfig:i386 libfreetype6:i386 libexpat1:i386 libc6:i386 libgtk-3-0:i386 \
	libcanberra0:i386 libpng12-0:i386 libice6:i386 libsm6:i386 libncurses5:i386 zlib1g:i386 \
	libx11-6:i386 libxau6:i386 libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386 \
	libxt6:i386 libxtst6:i386

RUN mkdir -p /root/freetype
WORKDIR /root/freetype
RUN wget http://download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.bz2
RUN apt-get build-dep -y -a i386 libfreetype6
RUN tar -xjvf freetype-2.4.12.tar.bz2
WORKDIR /root/freetype/freetype-2.4.12
RUN ./configure --build=i686-pc-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32"
RUN make -j8
RUN chmod +x /root/modelsim/ModelSimSetup-13.1.0.162.run 
RUN /root/modelsim/ModelSimSetup-13.1.0.162.run --mode unattended --installdir /root/altera
RUN mkdir -p /root/.local/bin
RUN ln -s /root/altera/modelsim_ase/bin/vsim /root/.local/bin
RUN echo 'export LD_LIBRARY_PATH=/root/freetype/freetype-2.4.12/objs/.libs' > /root/.local/bin/start_vsim
RUN chmod +x /root/.local/bin/start_vsim
WORKDIR /root

