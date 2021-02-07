#!/usr/bin/env bash

HADMIN=/share/CACHEDEV1_DATA/homes/admin/

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
    /opt/bin/opkg install python-pip
    /opt/bin/opkg install python-psutil
    pip install glances
    /opt/bin/opkg install unzip
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
touch $HADMIN/.z && ln -s $HADMIN/.z /root/.z
ln -s $HADMIN/dotfiles/osx-tmux/.tmux.conf /root/.tmux.conf





rm -f /root/.vimrc
ln -s /share/CACHEDEV1_DATA/homes/admin/dotfiles/neovim/.vimrc /root/.vimrc
ln -s /share/CACHEDEV1_DATA/homes/admin/dotfiles/neovim/.vim /root/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
