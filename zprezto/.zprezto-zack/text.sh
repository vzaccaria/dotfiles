
,cat() {
  pygmentize -f terminal256 -O style=monokai -g
}
,less() {
  pygmentize -f terminal256 -O style=monokai -g "$1" | less -r
}

,live-edit-org-rtd() {
    org2pdf "$1" --latex-engine html -a /Users/zaccaria/dotfiles/org-headers/header_html_rtd.org -p -w -y 'make chromereload' 
}

,live-edit-org() {
    org2pdf "$1" --latex-engine html -a /Users/zaccaria/dotfiles/org-headers/header_html_simple.org -p -w -y 'make chromereload'
}

,markdown-to-html() {
   pandoc -f markdown -t html "$1" | pbcopy
}

em() {
    TYPE=$(uname)
    if [ "${TYPE}" = "Linux" ]; then
        _P="/usr/bin/"
    elif [ "${TYPE}" = "Darwin" ]; then
        _P="/usr/local/bin/"
    else
        echo "Unsupported OS - ${TYPE}";
        _P=""
    fi
    if [ "$1" = "start" ]; then
            "${_P}emacs" --daemon 2>&1 >/dev/null | spacemacsStart
    elif [ "$1" = "stop" ]; then
            "${_P}/emacsclient" -e "(kill-emacs)"
    elif [ "$1" = "restart" ]; then
        em stop
        sleep 2
        em start
    else
            "${_P}/emacsclient" -nw "$@" -c
    fi
}

