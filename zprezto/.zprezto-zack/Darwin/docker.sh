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


dock-remove-all-containers() {
    docker kill $(docker ps -q)
}

dock-remove-exited-containers() {
   docker rm $(docker ps -aq)
}

dock-remove-dangling-images() {
   docker rmi $(docker images --filter dangling=true --quiet)
}

dock-stop-k8s() {
    docker ps -a | grep k8 | cut -d ' ' -f 1 | xargs docker stop
    docker ps -a | grep kubelet | cut -d ' ' -f 1 | xargs docker stop
}

dock-remove-k8s() {
    docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm 
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
