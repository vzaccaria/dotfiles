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


gitchanged() {
    git diff --numstat --diff-filter=M $* | cut -f3 | tr '\n' '\0' | map basename _ | paste -s -d, - | sed 's/,/, /g' 
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

