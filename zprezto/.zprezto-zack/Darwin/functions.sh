# GitHub aliases
eval "$(hub alias -s)"

# Zed magic cd
. `brew --prefix`/etc/profile.d/z.sh

vi() {
    emacsclient "$@" -c &
}

startemacs() {
    ~/Applications/Emacs.app/Contents/MacOS/Emacs --eval "(server-start)"
}

towerthis() {
    open -a "Tower" .
}



