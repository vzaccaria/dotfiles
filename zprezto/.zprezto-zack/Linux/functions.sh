vi() {
    /usr/local/bin/emacsclient -nw "$@" -c
}

startemacs() {
    /usr/local/bin/emacs --daemon
}

stopemacs() {
    /usr/local/bin/emacsclient -e "(kill-emacs)"
}


restartemacs() {
    stopemacs
    sleep 2
    startemacs
}

