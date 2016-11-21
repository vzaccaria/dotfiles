
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
    echo "# What is it"
    echo ""
    echo "Commands to run a docker image on qnappino by mounting a remote qnappino directory locally."
    echo "Steps:"
    echo "  1) first mount the remote qnappino directory with dockshare-mount DIR (DIR should be empty)"
    echo "  2) run the container with "
    echo ""
    echo "# Command list:"
    echo ""
    echo " * dockshare-mount DIR : mount the remote directory qnappino:${DOCKSHARE_REMOTE_DIR} as local:DIR"
    echo " * dockshare-run IMAGE : run a container with qnappino:${DOCKSHARE_REMOTE_DIR} mounted as container:${DOCKSHARE_CONTAINER_DIR}"
}

export DOCKSHARE_CONTAINER_DIR="/Data"
export DOCKSHARE_REMOTE_DIR="/share/CACHEDEV1_DATA/Multimedia/Data"

dockshare-run() {
    docker run --rm -ti -v "${DOCKSHARE_REMOTE_DIR}":"${DOCKSHARE_CONTAINER_DIR}" $1
}

dockshare-mount() {
   sshfs -p 21101 admin@vzaccaria.myqnapcloud.com:${DOCKSHARE_REMOTE_DIR} `grealpath $1` -ovolname=Data 
}

qnap-mount-backup() {
   mkdir -p /Volumes/Data
   sshfs -p 21101 admin@vzaccaria.myqnapcloud.com:/share/CACHEDEV1_DATA/Multimedia/Data /Volumes/Data -ovolname=Data 
}

qnap-mount-multimedia() {
   mkdir -p /Volumes/Multimedia
   sshfs -p 21101 admin@vzaccaria.myqnapcloud.com:/share/CACHEDEV1_DATA/Multimedia /Volumes/Multimedia -ovolname=Multimedia
}

devenv-openx11() {
    open -a "XQuartz"
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
}

devenv-help() {
    echo "1. Open X11 locally with devenv-openx11"
    echo "2. On the remote machine, setup the following display:"
    echo ""
    echo "   export DISPLAY=`ip-show-all-local | grep 192.168.1`:0"
}

# Not working:
# qnap-mount-multimedia() {
#     sudo mount -o rw,bg,hard,resvport,intr,noac,nfc,tcp 192.168.1.120:/Multimedia /Volumes/Multimedia/
# }
