# Darwin - docker specific commands


# Heads up.. a `default` docker machine should be created before the docker configuration
# has any effect (typically on a newly installed docker toolbox):
#
#    docker-machine create --driver virtualbox default

is_default_running() {
    docker-machine ls | grep "^default" | grep "Running"
}

# Check if the machine is running


echo "docker env (or use 'docker-machine start default')"
is_default_running
if [ "${?}" = 0 ]; then
    eval "$(docker-machine env default)" > /dev/null
    echo_ok
else
    echo_skipped
fi

dock-ssh() {
    docker run -i -t $@ /bin/bash
}
