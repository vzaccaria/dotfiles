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
    docker run -ti --cap-add SYS_ADMIN --device /dev/fuse $@
}


# Download certs from container station
FW=2.238.147.123

dock-setup-qnappino() {
    export DOCKER_CERT_PATH=/Users/zaccaria/dotfiles/zprezto/.zprezto-zack/Darwin/qnap-certs
    export DOCKER_HOST=tcp://192.168.1.120:2376 DOCKER_TLS_VERIFY=1
    alias docker='docker --tlsverify'
}

dock-setup-qnappino-remote() {
    export DOCKER_CERT_PATH=/Users/zaccaria/dotfiles/zprezto/.zprezto-zack/Darwin/qnap-certs
    export DOCKER_HOST=tcp://$FW:2376
    alias docker='docker --tlsverify'       #
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
    echo "* dock-ssh IMGTAG"
    echo "* dock-run-cmd IMGTAG CMD [ARGS]               "
    echo "* dock-mount-and-run-cmd VOL IMGTAG CMD [ARGS] # Not interactive!"
    echo "* rclone2.0-lsd"
    echo "* rclone2.0-copy SUBDIR"
}

dock-ssh() {
    # Pass: image
    docker run -i -t $@ sh
}

dock-run-cmd() {
    # Pass: image cmd [args]
    echo "docker run -i -t $@"
    docker run -i -t $@
}

dock-mount-and-run-cmd() {
    echo "docker run -t -v $1:/opt/dockhost:ro ${@:2}"
    docker run -t -v $1:/opt/dockhost:ro ${@:2}
}

rclone2.0-lsd() {
    dock-run-cmd rclone2.0 rclone lsd dropbox:Nas
}

rclone2.0-copy() {
    dock-mount-and-run-cmd /share/CACHEDEV1_DATA/Multimedia/$1 rclone2.0 rclone sync /opt/dockhost dropbox:Nas/$1
}
