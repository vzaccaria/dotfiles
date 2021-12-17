

# Emacs starter
start-container() {
    HOSTPORT=$1
    CWD=$(pwd)
    docker run -d -p $1:5900 -v $CWD:/local --privileged devenv-vnc-latest
}

