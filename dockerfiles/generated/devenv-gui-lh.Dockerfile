FROM    ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/zsh
ENTRYPOINT /bin/zsh

RUN echo "Rebuild on Jan 20, 2018, v0"

RUN apt-get update && apt-get install -y locales
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

RUN add-apt-repository -y ppa:kelleyk/emacs
RUN apt-get update
RUN apt-get install -y emacs25

RUN echo "Rebuild on Jan 20, 2018, v2"
RUN add-apt-repository -y ppa:cpick/hub
RUN apt-get update
RUN apt-get install -y hub
RUN hub config --global hub.protocol https

RUN wget https://github.com/github/hub/releases/download/v2.2.8/hub-linux-amd64-2.2.8.tgz

RUN git clone https://github.com/vzaccaria/dotfiles.git /root/dotfiles
WORKDIR /root/dotfiles

RUN git clone https://github.com/syl20bnr/spacemacs /root/.emacs.d
RUN cd /root/.emacs.d && git checkout tags/v0.200.11

WORKDIR /root/dotfiles/zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles/zprezto/.zprezto
RUN git submodule update --init
WORKDIR /root/dotfiles

RUN stow zprezto linux-tmux spacemacs

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
RUN wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | apt-key add - && \
    echo 'deb http://download.fpcomplete.com/ubuntu trusty main' | tee /etc/apt/sources.list.d/fpco.list && \
    apt-get update && apt-get install stack -y
RUN stack upgrade
ENV PATH /root/.local/bin:$PATH
RUN stack setup
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

COPY scripts/startx ./

RUN mkdir Desktop .vnc && \
	  echo "startlxde" > .vnc/xstartup && \
    chmod +x startx .vnc/xstartup
RUN apt-get install -y expect
CMD ["/root/startx"]

RUN git clone --recursive https://github.com/ucsd-progsys/liquidhaskell.git

WORKDIR /root/liquidhaskell
RUN stack install --install-ghc
RUN stack test liquidhaskell --no-run-tests
RUN stack install
ENV PATH /root/.local/bin:$PATH
WORKDIR /root
RUN apt-get install -y z3
RUN stack install hlint
RUN wget https://raw.githubusercontent.com/ndmitchell/hlint/master/.hlint.yaml --no-check-certificate






