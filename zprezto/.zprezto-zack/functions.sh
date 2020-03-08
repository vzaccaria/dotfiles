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

accent() {
sed -E "\
s/uo'/uò/g; \
s/perche'/perchè/g; \
s/poiche'/poiché/g; \
s/a'/à/g; \
s/ e'/è/g; \
s/cosi'/così/g" "$@"
}

org2json() {
    emacs "$1" -l ~/.emacs --batch --eval="(org-as-json-to-file)"
}

httpdump() {
    sudo tcpdump -i "$1" -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"
}


putfile() {
    scp -P 2222 "$1" zaccaria@vzaccaria.myqnapcloud.com:~/deposit
}

getfile() {
    scp -P 2222 "zaccaria@vzaccaria.myqnapcloud.com:~/deposit/*" .
}

ediff() {
    emacsclient -t --eval "(ediff \"$1\" \"$2\")"
}

showformula() {
    template="\\documentclass[border=2pt]{standalone} \\usepackage{amsmath} \\usepackage{varwidth} \\begin{document} \\begin{varwidth}{\linewidth} \\input{$1} \\end{varwidth} \\end{document}"
    pdflatex -jobname=formula "$template" && rm formula.log formula.aux
    open formula.pdf
}

git-diff-to-html() {
    git diff --color=always $* | diff-so-fancy | aha
}

vz-live-edit-org-rtd() {
    org2pdf "$1" --latex-engine html -a /Users/zaccaria/dotfiles/org-headers/header_html_rtd.org -p -w -y 'make chromereload' 
}

vz-live-edit-org() {
    org2pdf "$1" --latex-engine html -a /Users/zaccaria/dotfiles/org-headers/header_html_simple.org -p -w -y 'make chromereload'
}

vz-markdown-to-html() {
   pandoc -f markdown -t html "$1" | pbcopy
}


vz-rename-currentdir-files-removing-spaces() {
  find . -depth -name "* *" -execdir rename 's/ /_/g' "{}" \;
}


