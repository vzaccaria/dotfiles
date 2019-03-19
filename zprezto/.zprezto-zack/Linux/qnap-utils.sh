
qnap-home-ssh-plain() {
    ssh -p 21101 admin@192.168.1.120 
}

qnap-home-ssh() {
    ssh -p 21101 admin@192.168.1.120 -t '/opt/bin/zsh -l'
}

