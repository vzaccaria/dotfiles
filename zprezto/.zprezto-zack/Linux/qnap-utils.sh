
qnap-remote-ssh-plain() {
    ssh -p 21101 admin@vzaccaria.myqnapcloud.com -p 21101
}

qnap-remote-ssh-zsh() {
    ssh -p 21101 admin@vzaccaria.myqnapcloud.com -t '/opt/bin/zsh -l'
}

qnap-home-ssh() {
    ssh -p 21101 admin@vzaccaria.myqnapcloud.com -t '/opt/bin/zsh -l'
}

