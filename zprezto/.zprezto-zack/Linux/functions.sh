

if [ -e /home/admin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/admin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

em() {
    /usr/bin/emacsclient -nw "$@" -c
}

gem() {
    /usr/bin/emacsclient "$@" -c
}

startemacs() {
    /usr/bin/emacs --daemon 2>&1 >/dev/null | spacemacsStart
}

startemacs-safe() {
    /usr/bin/emacs --daemon 2>&1 >/dev/null
}

stopemacs() {
    /usr/bin/emacsclient -e "(kill-emacs)"
}


restartemacs() {
    stopemacs
    sleep 2
    startemacs
}

wallpaperrefresh() {
    feh --bg-fill  $HOME/dotfiles/wallpapers/wallpaper.jpg
}


wallpapercircle() {
    pscircle                                    \
        --output-width=1920                     \
        --output-height=1600                    \
        --root-pid=1                            \
        --max-children=90                       \
        --tree-center=0.0:0.0                   \
        --tree-radius-increment=120             \
        --tree-sector-angle=6.17                \
        --tree-rotate=0                         \
        --tree-rotation-angle=0                 \
        --tree-anchor-proc-name=kthreadd        \
        --tree-anchor-proc-angle=0              \
        --tree-font-size=12                     \
        --tree-font-face=Sans                   \
        --tree-font-color=EEEEEEB4              \
        --dot-radius=2                          \
        --dot-border-width=1                    \
        --dot-color-min=258451FF                \
        --dot-color-max=C12A2AFF                \
        --dot-border-color-min=3D5B63FF         \
        --dot-border-color-max=9B6868FF         \
        --link-width=1.25                       \
        --link-convexity=0.4                    \
        --link-color-min=3D5B63FF               \
        --link-color-max=9B6868FF               \
        --toplists-row-height=20                \
        --toplists-font-size=12                 \
        --toplists-font-color=EEEEEEB4          \
        --toplists-pid-font-color=828282FF      \
        --toplists-font-face=Sans               \
        --toplists-column-padding=15            \
        --toplists-bar-width=60                 \
        --toplists-bar-height=3                 \
        --toplists-bar-background=444444FF      \
        --toplists-bar-color=DDDDDDFF           \
        --cpulist-center=700.0:-420.0           \
        --memlist-center=700.0:420.0            \
        --output=$HOME/.wallpaper-pscircle.png
    feh --no-fehbg --bg-fill $HOME/.wallpaper-pscircle.png
}


wallpaperrun() {
    while true; do
        wallpapercircle
        sleep 30
    done;
}
