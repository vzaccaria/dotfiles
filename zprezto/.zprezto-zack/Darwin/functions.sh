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

# Use coreutils' grealpath

rp() {
	grealpath $1 | tr -d '\n' | pbcopy
}

islink() {
	grealpath -e "/usr/local/bin/$1"
}
