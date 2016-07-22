vi() {
    /usr/bin/emacsclient -nw "$@" -c
}

startemacs() {
    /usr/bin/emacs --daemon
}

stopemacs() {
    /usr/bin/emacsclient -e "(kill-emacs)"
}


restartemacs() {
    stopemacs
    sleep 2
    startemacs
}

