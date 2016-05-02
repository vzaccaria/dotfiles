
qnap-mosh() {
    mosh --ssh='ssh -p 21101' -p 21102 --server='/opt/bin/mosh-server' admin@qnappino -- /opt/bin/zsh -l
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

dock-setup-remote-qnappino-env() {
    export DOCKER_CERT_PATH=/Users/zaccaria/dotfiles/zprezto/.zprezto-zack/Darwin/qnap-certs
    export DOCKER_HOST=tcp://localhost:2376
    export DOCKER_TLS_VERIFY=true
}
