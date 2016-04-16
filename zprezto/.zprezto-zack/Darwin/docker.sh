# Darwin - docker specific commands


# Heads up.. a `default` docker machine should be created before the docker configuration
# has any effect (typically on a newly installed docker toolbox):
#
#    docker-machine create --driver virtualbox default
#
# See the bottom of this file

dock-is_default_running() {
    docker-machine ls | grep "^default" | grep "Running"
}

# Check if the machine is running
# Otherwise you should do a docker-machine start default


echo "docker env (or use 'docker-machine start default')"
dock-is_default_running
if [ "${?}" = 0 ]; then
    eval "$(docker-machine env default)" > /dev/null
    echo_ok
else
    echo_skipped
fi

dock-ssh-sysadmin() {
    docker run --rm -ti --cap-add SYS_ADMIN --device /dev/fuse $@
}


# Download certs from container station

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
dock-setup-remote-qnappino-env() {
    export DOCKER_CERT_PATH=/Users/zaccaria/dotfiles/zprezto/.zprezto-zack/Darwin/qnap-certs
    export DOCKER_HOST=tcp://localhost:2376
    alias docker='docker --tlsverify'       #
}

dock-remove-exited-containers-tls() {
   docker --tlsverify  rm $(docker --tlsverify ps -aq)
}

dock-remove-dangling-images-tls() {
   docker --tlsverify rmi $(docker --tlsverify images --filter dangling=true --quiet)
}

dock-remove-exited-containers() {
   docker rm $(docker ps -aq)
}

dock-remove-dangling-images() {
   docker rmi $(docker images --filter dangling=true --quiet)
}

dock-build-as() {
   docker build -t $1 .
}

dock-help() {
    echo "Available commands: "
    echo " "
    echo "* dock-build-as IMGTAG"
    echo "* dock-ssh IMGTAG"
    echo "* dock-run-cmd IMGTAG CMD [ARGS]               "
    echo "* dock-mount-and-run-cmd VOL IMGTAG CMD [ARGS] # Not interactive!"
    echo "* rclone2.0-lsd"
    echo "* rclone2.0-copy SUBDIR"
}

dock-ssh() {
    # Pass: image
    docker run --rm -i -t $@ sh
}

dock-run-cmd() {
    # Pass: image cmd [args]
    echo "docker run --rm -i -t $@"
    docker run --rm -i -t $@
}

dock-mount-and-run-cmd() {
    echo "docker run -t -v $1:/opt/dockhost:ro ${@:2}"
    docker run --rm -t -v $1:/opt/dockhost:ro ${@:2}
}

rclone2.0-lsd() {
    dock-run-cmd rclone2.0 rclone lsd dropbox:Nas
}

rclone2.0-copy() {
    dock-mount-and-run-cmd /share/CACHEDEV1_DATA/Multimedia/$1 rclone2.0 rclone sync /opt/dockhost dropbox:Nas/$1
}
