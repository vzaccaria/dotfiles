RUN add-apt-repository -y ppa:neovim-ppa/stable
RUN apt-get update 
RUN apt-get install -y neovim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
WORKDIR /root/dotfiles
RUN stow neovim


