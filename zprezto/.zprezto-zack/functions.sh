f() {
    name=$1
    find . -name "*${name}*"
}

fe() {
    ext=$1
    find . -name "*\.${ext}"
}

fex() {
    ext=$1
    other=${*:2} 
    find . -name "*\.${ext}" -exec sh -c "${other}" \;
}

c() {
   git cm "$@" && git push --all
}

initial() {
    git add $* && git commit -m "initial commit"
}

chore() {
  git add $* && git commit -m "chore: some chore work"
}

minor() {
  git add $* && git commit -m "minor: some minor work"
}

refactor() {
  git add $* && git commit -m "refactor: make it future proof"
}

fix() {
  git add ${@:1: -1} && git commit -m "fix: ${@: -1}"
}

update() {
    git add ${@:1: -1} && git commit -m "update: ${@: -1}"
}

u() {
    git add ${@:1: -1} && git commit -m "update: ${@: -1}"
}

feat() {
  git add ${@:1: -1} && git commit -m "feat: ${@: -1}"
}

amend() {
  git commit --amend --no-edit
}


pcat() {
  pygmentize -f terminal256 -O style=monokai -g
}
pless() {
  pygmentize -f terminal256 -O style=monokai -g $1 | less -r
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
            echo " - Use `fmap` instead of `map` to flatten results into a sequence of 0-ended file names "
            echo " - Available lift instances: find, ag, locate, head, tail, ls "
            ;;
        find)
            find . -name ${opts} -print0
            ;;
        ag)
            ag -l --nocolor -0 ${opts}
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

git-ignore-edit() {
    vi "$(git root)/.gitignore"
}

git-chdir-into-root() {
    pushd "$(git rev-parse --show-toplevel)"
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
