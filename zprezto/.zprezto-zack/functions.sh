

f() {
   find . -name "*$@*"
}

p() {
   ps -fe | grep -v grep | grep "$@" -i --color=auto;
}

c() {
   git cm "$@" && git push --all
}

dock-connect() {
    docker run -i -t $@ /bin/bash
}

pcat() {
	pygmentize -f terminal256 -O style=monokai -g
}
pless() {
	pygmentize -f terminal256 -O style=monokai -g $1 | less -r
}

# read markdown files like manpages
md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}


