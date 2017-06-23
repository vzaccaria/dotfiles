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

lift() {
    arg=$1
    opts=${*:2}
    case "${arg}" in
        help)
            echo "# Lift. "
            echo "Lift a command to produce a sequence of 0 ended names of files."
            echo ""
            echo "Typical usage: "
            echo ""
            echo " lift cat filenames.txt | map command ... _ ... "
            echo "                                          ^--- placeholder for filename among the args"
            echo ""
            echo " - Use fmap instead of map to flatten results into a sequence of 0-ended file names "
            echo " - Available lift instances: find, ag, locate, head, tail, ls "
            echo " - If you need to execute based on extension, use fex extension command {} "
            echo "                                                                         ^- placeholder for file"
            ;;
        find)
            find . -name "${opts}" -print0
            ;;
        ag)
            ag -l --nocolor -0 "${opts}"
            ;;
        locate)
            "$@" -0
            ;;
        head)
            "$@" | tr '\n' '\0'
            ;;
        cat)
            "$@" | tr '\n' '\0'
            ;;
        tail)
            "$@" | tr '\n' '\0'
            ;;
        ls)
            "$@" -1 | tr '\n' '\0'
            ;;
        *)
            echo "Sorry no lift instance available for $1"
            ;;
    esac
}


httpdump() {
    sudo tcpdump -i "$1" -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"
}



map() {
    command=$1
    args=${*:2}
    xargs -0 -n 1 -J _ "$command" "$args"
}

fmap() {
    command=$1
    args=${*:2}
    xargs -0 -n 1 -J _ "$command" "$args" | tr '\n' '\0'
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
