

f() {
   find . -name "*$@*"
}

fe() {
   find . -name "*\.$@"
}


p() {
   ps -fe | grep -v grep | grep "$@" -i --color=auto;
}

c() {
   git cm "$@" && git push --all
}

chore() {
	git cm "chore: $*"
}

fix() {
	git cm "fix: $*"
}

feat() {
	git cm "feat: $*"
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

lift() {
	case "$1" in
		find)
			find . -name $2 -print0
			;;
		ag)
			$* -l --nocolor -0
			;;
		locate)
			$* -0
			;;
		head)
			$* | tr '\n' '\0'
			;;
		tail)
			$* | tr '\n' '\0'
			;;
		ls)
			$* -1 | tr '\n' '\0'
			;;
		*)
			echo "Sorry no lift instance available for $1"
			;;
	esac
}

lifta() {
	cat $* | tr '\n' '\0'
}

fmap() {
	xargs -0 -n 1 -J _ $*
}

map() {
	xargs -0 -n 1 -J _ $* | tr '\n' '\0'
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
