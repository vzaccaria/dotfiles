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

RUN wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | apt-key add -
RUN echo 'deb http://download.fpcomplete.com/ubuntu trusty main' | tee /etc/apt/sources.list.d/fpco.list
RUN apt-get update && apt-get install stack -y
RUN stack setup
RUN apt-get install -y libtinfo-dev
RUN apt-get install -y libncurses5-dev
RUN stack install clash-ghc
RUN stack install clash-prelude
RUN stack install tasty tasty-hunit tasty-quickcheck

CMD emacs
