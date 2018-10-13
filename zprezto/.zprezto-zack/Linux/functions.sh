

if [ -e /home/admin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/admin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

vi() {
    /usr/bin/emacsclient -nw "$@" -c
}

gvim() {
    /usr/bin/emacsclient "$@" -c
}

startemacs() {
    /usr/bin/emacs --daemon 2>&1 >/dev/null | spacemacsStart
}

stopemacs() {
    /usr/bin/emacsclient -e "(kill-emacs)"
}


restartemacs() {
    stopemacs
    sleep 2
    startemacs
}




