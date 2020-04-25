
,cat() {
  pygmentize -f terminal256 -O style=monokai -g
}
,less() {
  pygmentize -f terminal256 -O style=monokai -g "$1" | less -r
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


