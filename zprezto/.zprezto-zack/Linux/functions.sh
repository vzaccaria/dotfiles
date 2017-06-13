

if [ -e /home/admin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/admin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

vi() {
    /usr/bin/emacsclient -nw "$@" -c
}

gvim() {
    /usr/bin/emacsclient "$@" -c
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



map() {
    command=$1
    args=${*:2}
    xargs -0 -n 1 -I _ "$command" "$args"
}

fmap() {
    command=$1
    args=${*:2}
    xargs -0 -n 1 -I _ "$command" "$args" | tr '\n' '\0'
}

