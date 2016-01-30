vi() {
    /opt/emacs/bin/emacsclient -nw "$@" -c
}

startemacs() {
    /opt/emacs/bin/emacs --daemon
}

stopemacs() {
    /opt/emacs/bin/emacsclient -e "(kill-emacs)"
}


restartemacs() {
    stopemacs
    sleep 2
    startemacs
}

