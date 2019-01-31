
build-vimtheme:
	themer -c themer-colors-default -t themer-vim -o gen
	mkdir -p neovim/.vim/colors
	mv ./gen/themer-vim/ThemerVim.vim neovim/.vim/colors
	rm -rf gen


	
