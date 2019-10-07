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


