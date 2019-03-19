rm -f /root/.vimrc
ln -s /share/CACHEDEV1_DATA/homes/admin/dotfiles/neovim/.vimrc /root/.vimrc
ln -s /share/CACHEDEV1_DATA/homes/admin/dotfiles/neovim/.vim /root/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
