echo "Overriding configuration for qnappino"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export DEFAULT_CHARSET=UTF-8
export EDITOR=emacsclient
export GIT_EDITOR=emacsclient
export SHELL=/opt/bin/zsh
alias vi=vim
alias ln=ln
alias make=make

spacemacs() {
	docker run -ti --rm \
	-v /etc/localtime:/etc/localtime:ro                     \
	-v /share/CACHEDEV1_DATA/homes/admin/projects:/projects \
	-v /share/CACHEDEV1_DATA/homes/admin/projects/dot-stack:/root/.stack \
	-v /share/CACHEDEV1_DATA/homes/admin/projects/dot-local:/root/.local \
	-e DISPLAY=$DISPLAY \
	-e PATH=/root/.local/bin:/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/sbin:/usr/local/bin \
	--name spacemacs \
	devenv-latest
}
