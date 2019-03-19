
qnap-home-ssh-plain() {
    ssh -p 21101 admin@192.168.1.120 
}

qnap-home-ssh() {
    ssh -p 21101 admin@192.168.1.120 -t '/opt/bin/zsh -l'
}

qnap-mount-multimedia() {
     # /mnt/qnap.. must be owned by admin
    sudo sshfs -p 21101 -oallow_other,IdentityFile=/home/admin/.ssh/id_rsa admin@192.168.1.120:/share/CACHEDEV1_DATA/Multimedia /mnt/qnapmedia
}



