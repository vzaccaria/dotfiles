#!/usr/bin/env bash

HADMIN=/share/CACHEDEV1_DATA/homes/admin

if [[ -x /opt/bin/opkg ]]; then
    echo "Installing Entware Packages"
    # install entware packages
    /opt/bin/opkg update
    /opt/bin/opkg install bash
    /opt/bin/opkg install git
    /opt/bin/opkg install git-http
    /opt/bin/opkg install grep
    /opt/bin/opkg install htop
    /opt/bin/opkg install jq
    /opt/bin/opkg install zsh
    /opt/bin/opkg install node
    /opt/bin/opkg install node-npm
    /opt/bin/opkg install grep
    /opt/bin/opkg install coreutils-realpath
    /opt/bin/opkg install python3-pip
    /opt/bin/opkg install python3-psutil
    /opt/bin/opkg install vim-full
    pip install glances
    /opt/bin/opkg install unzip
    /opt/bin/opkg install tmux
else
    echo "Please install Entware"
    exit 1
fi

if [[ ! -d $HADMIN/dotfiles ]]; then
    git clone https://github.com/vzaccaria/dotfiles.git $HADMIN/dotfiles
    cd $HADMIN/dotfiles/zprezto && git submodule update --init
    cd $HADMIN/dotfiles/zprezto/.zprezto && git submodule update --init
fi

echo "ZDOTDIR=$HADMIN/dotfiles/zprezto" > /root/.zshenv
rm -f /root/.z && touch $HADMIN/.z && ln -s $HADMIN/.z /root/.z
rm -f .tmux.conf && ln -s $HADMIN/dotfiles/lean-tmux/.tmux.conf /root/.tmux.conf
rm -f dotfiles && ln -s $HADMIN/dotfiles .

if [[ ! -x /opt/bin/exa ]]; then
   wget -c https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
   unzip exa-linux-x86_64-0.8.0.zip
   mv exa-linux-x86_64 /opt/bin/exa
fi

git config --global user.email "vittorio.zaccaria@gmail.com"
git config --global user.name "Vittorio Zaccaria"



