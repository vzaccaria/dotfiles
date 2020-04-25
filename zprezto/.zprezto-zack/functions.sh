f() {
    name=$1
    find . -iname "*${name}*"
}

fe() {
    ext=$1
    find . -iname "*\.${ext}"
}

fex() {
    ext=$1
    other=${*:2} 
    find . -iname "*\.${ext}" -exec sh -c "${other}" \;
}


pcat() {
  pygmentize -f terminal256 -O style=monokai -g
}
pless() {
  pygmentize -f terminal256 -O style=monokai -g "$1" | less -r
}

# read markdown files like manpages
mandown() {
    pandoc -s -f markdown -t man "$*" | man -l -
}




ediff() {
    emacsclient -t --eval "(ediff \"$1\" \"$2\")"
}


,git-diff-to-html() {
    git diff --color=always $* | diff-so-fancy | aha
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


