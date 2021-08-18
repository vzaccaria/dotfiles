echo "Overriding configuration for qnappino"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export DEFAULT_CHARSET=UTF-8
export EDITOR=vi
export GIT_EDITOR=vi
export SHELL=/opt/bin/zsh
alias vi=vim
alias ln=ln
alias make=make

export PATH=/opt/bin:/share/CACHEDEV1_DATA/.qpkg/container-station/bin:$PATH
export TERM=xterm-256color

sen() {
   docker run -v /var/run/docker.sock:/run/docker.sock -ti -e TERM tomastomecek/sen
}

startlanguagetool() {
   docker run -d -p 8010:8010 vzaccaria/languagetool:3.8 
}

ubuntu() {
	  docker run -ti --rm \
           -p 5901:5901 \
	         -v /etc/localtime:/etc/localtime:ro                     \
	         -v /share/CACHEDEV1_DATA/homes/admin/projects:/projects \
	         -v /share/CACHEDEV1_DATA/homes/admin/projects/dot-local:/root/.local \
	         -e DISPLAY=$DISPLAY \
	         -e PATH=/root/.local/bin:/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/sbin:/usr/local/bin \
	         --name devenv-gui \
	         devenv-gui-latest \
	         /bin/zsh
}

spacemacs() {
	docker run -ti --rm \
	-v /etc/localtime:/etc/localtime:ro                     \
	-v /share/CACHEDEV1_DATA/homes/admin/projects:/projects \
	-v /share/CACHEDEV1_DATA/homes/admin/projects/dot-local:/root/.local \
	-e DISPLAY=$DISPLAY \
	-e PATH=/root/.local/bin:/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/sbin:/usr/local/bin \
	--name spacemacs \
	devenv-latest \
	emacs
}

modelsim() {
	docker run -ti --rm \
	-v /etc/localtime:/etc/localtime:ro                     \
	-v /share/CACHEDEV1_DATA/homes/admin/projects:/projects \
	-e DISPLAY=$DISPLAY \
	-e PATH=/root/.local/bin:/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/sbin:/usr/local/bin \
	--name modelsim \
	modelsim-latest \
	/bin/zsh
}

sendtoinbox() {
        scp $1 zaccaria@192.168.188.49:/Users/zaccaria/GDrive/Inbox
}

