
qnap-mosh() {
    mosh --ssh='ssh -p 21101' -p 21102 --server='/opt/bin/mosh-server' admin@vzaccaria.myqnapcloud.com -- /opt/bin/zsh -l
}

qnap-ssh-plain() {
    ssh -p 21101 admin@qnappino
}

qnap-ssh() {
    ssh -p 21101 admin@qnappino -t '/opt/bin/zsh -l'
}

dock-setup-qnappino() {
    export DOCKER_CERT_PATH=/Users/zaccaria/dotfiles/zprezto/.zprezto-zack/Darwin/qnap-certs
    echo "This command assumes that certs are in $DOCKER_CERT_PATH"
    export DOCKER_HOST=tcp://192.168.1.120:2376 DOCKER_TLS_VERIFY=1
    alias docker='docker --tlsverify'
}

dock-setup-remote-qnappino-bridge() {
    echo "Setting up tunnel"
    ssh -N -L 2376:192.168.1.120:2376 zaccaria@vzaccaria.myqnapcloud.com -p 2222
}

dock-setup-remote-qnappino-bridge-direct() {
    echo "Setting up tunnel"
    ssh -N -L 2376:192.168.1.120:2376 admin@qnappino -p 21101
}

dock-mobile-connect() {
    dock-setup-remote-qnappino-bridge-direct &
    dock-setup-remote-qnappino-env
}

dock-setup-remote-qnappino-env() {
    export DOCKER_CERT_PATH=/Users/zaccaria/dotfiles/zprezto/.zprezto-zack/Darwin/qnap-certs
    export DOCKER_HOST=tcp://localhost:2376
    export DOCKER_TLS_VERIFY=true
}


dockshare-help() {
    manmd ~/dotfiles/docs/devenv.md
}

export DOCKSHARE_CONTAINER_DIR="/Data"
export DOCKSHARE_REMOTE_DIR="/share/CACHEDEV1_DATA/Multimedia/Data"

dockshare-run() {
    docker run --rm -ti -v "${DOCKSHARE_REMOTE_DIR}":"${DOCKSHARE_CONTAINER_DIR}" $1
}

dockshare-mount() {
   echo "to unmount: umount $1"
   sshfs -p 21101 admin@vzaccaria.myqnapcloud.com:${DOCKSHARE_REMOTE_DIR} `grealpath $1` -ovolname=Data
}

dockshare-mount-local() {
    echo "to unmount: umount $1"
    sshfs -p 21101 admin@192.168.1.120:${DOCKSHARE_REMOTE_DIR} `grealpath $1` -ovolname=Data
}

qnap-mount-backup() {
   mkdir -p /Volumes/Data
   sshfs -p 21101 admin@vzaccaria.myqnapcloud.com:/share/CACHEDEV1_DATA/Multimedia/Data /Volumes/Data -ovolname=Data
}

qnap-mount-multimedia() {
   mkdir -p /Volumes/Multimedia
   sshfs -p 21101 admin@vzaccaria.myqnapcloud.com:/share/CACHEDEV1_DATA/Multimedia /Volumes/Multimedia -ovolname=Multimedia
}

photoenv-mount-qnap() {
   mkdir -p /Volumes/Multimedia
   sshfs -p 21101 admin@192.168.1.120:/share/CACHEDEV1_DATA/Multimedia /Volumes/Multimedia -ovolname=Multimedia
   open /Applications/Adobe\ Lightroom/Adobe\ Lightroom.app
}

itunesenv-mount-qnap() {
    mkdir -p /Volumes/Multimedia
    sshfs admin@192.168.1.120:/share/CACHEDEV1_DATA/Multimedia /Volumes/Multimedia -ovolname=Multimedia
    open /Applications/iTunes.app
}

devenv-openx11() {
    devenv-help
    open -a "XQuartz"
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
}

devenv-help() {
    manmd ~/dotfiles/docs/devenv.md
}

devenv-gui-connect-to-running-instance() {
    echo "Click here: vnc://192.168.1.120:5901"
}


devenv-gui-start-with-tag() {
    tag=$1
    img=`docker run -dt \
           -p 5901:5901 \
	         -v /etc/localtime:/etc/localtime:ro                     \
	         -v /share/CACHEDEV1_DATA/homes/admin/projects:/projects \
	         -v /share/CACHEDEV1_DATA/homes/admin/projects/dot-local:/root/.local \
	         -e PATH=/root/.local/bin:/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/sbin:/usr/local/bin \
	         devenv-gui-${tag}-latest`
    docker exec -d "$img" /root/startx
    echo "Click here: vnc://192.168.1.120:5901"
}

devenv-gui-start-with-tag-local() {
    tag=$1
    img=`docker run -dt \
           -p 5901:5901 \
	         -e PATH=/root/.local/bin:/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/sbin:/usr/local/bin \
           -v ~/development/github:/development/github \
	         devenv-gui-${tag}-latest`
    docker exec -d "$img" /root/startx
    echo "Click here: vnc://127.0.0.1:5901"
}

de-local() {
    open "vnc://127.0.0.1:5901"
}

de() {
    open "vnc://192.168.1.120:5901"
}
