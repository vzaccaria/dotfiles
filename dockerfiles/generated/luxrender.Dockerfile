FROM    ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/zsh
ENTRYPOINT /bin/zsh

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get install -y curl
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
    tmux \
    unzip \
    nodejs \
    build-essential \
    vim 


RUN git clone https://github.com/vzaccaria/dotfiles.git /root/dotfiles
RUN git clone https://github.com/syl20bnr/spacemacs /root/.emacs.d

WORKDIR /root/dotfiles/zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles/zprezto/.zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles

RUN stow zprezto tmux-linux spacemacs-linux

WORKDIR /root

ADD https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip /tmp/scp.zip
ADD http://www.ffonts.net/NanumGothic.font.zip /tmp/ng.zip

RUN mkdir -p /usr/local/share/fonts               && \
    unzip /tmp/scp.zip -d /usr/local/share/fonts  && \
    unzip /tmp/ng.zip -d /usr/local/share/fonts   && \
    chown ${uid}:${gid} -R /usr/local/share/fonts && \
    chmod 777 -R /usr/local/share/fonts           && \
    fc-cache -fv                                  && \
    emacs --insecure -nw -batch -u "${UNAME}" -q -kill && \
    emacs --insecure -nw -batch -u "${UNAME}" -q -kill && \
    npm install -g tern js-beautify && \
    git config --global user.email "vittorio.zaccaria@gmail.com" && \
    git config --global user.name "Vittorio Zaccaria" 
# Dockerfile for tasks requiring LuxRender.

RUN apt-get update && \
    apt-get install -y \
    curl \
    bzip2 \
    libglu1-mesa \
    libgomp1 && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

ENV LUXRENDER_BZ2_URL http://www.luxrender.net/release/luxrender/1.6/linux/lux-v1.6-x86_64-sse2-NoOpenCL.tar.bz2

RUN curl -SL ${LUXRENDER_BZ2_URL} | tar -xjv -C /opt

ENV LIBEMBREE_URL https://github.com/embree/embree/releases/download/v2.13.0/embree-2.13.0.x86_64.linux.tar.gz
RUN curl -SL ${LIBEMBREE_URL} > lib.tgz
RUN tar -xvf lib.tgz -C /opt

RUN ln -s /opt/lux-v1.5.1-x86_64-sse2 /opt/luxrender
RUN ln -s /opt/embree-2.13.0.x86_64.linux /opt/embree

ENV PATH=/opt/luxrender:$PATH LUXRENDER_ROOT=/opt/luxrender LD_LIBRARY_PATH=/opt/embree/lib:$LD_LIBRARY_PATH
RUN apt-get update && apt-get install -y p7zip-full
RUN mkdir -p /opt/examples && curl -SL http://cg.tuwien.ac.at/~zsolnai/luxrender-scenes/Conference_room.7z > /opt/examples/confroom.7z

