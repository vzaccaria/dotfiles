
# Maybe add an help for all these commands

gitchanged() {
    TYPE=$(uname)
    if [ "${TYPE}" = "Linux" ]; then
        git diff --numstat --diff-filter=M "$*" | awk '{printf("%s\0", $3)}' | map basename _ | paste -s -d, - | sed 's/,/, /g';
    elif [ "${TYPE}" = "Darwin" ]; then
        git diff --numstat --diff-filter=M "$*" | cut -f3 | tr '\n' '\0' | map basename _ | paste -s -d, - | sed 's/,/, /g';
    else
        echo "Unsupported OS - ${TYPE}";
    fi
}

vg() {
    com="$1"
    tgt="${@:2: -1}"
    msg="${@: -1}"

    mc=$(gitchanged "$tgt")

    case "$com" in
        initial)   msg="initial commit" ;;
        minor)     msg="minor: apply small changes ($mc)" ;;
        move)      msg="move/delete files";;
        fix)       msg="fix: $msg ($mc)" ;;
        polish)    msg="polish: prettify ($mc)" ;;
        refactor)  msg="refactor: ($mc)";;
        sync)      msg="sync: ($mc)";;
        feat)      msg="feat: $msg (in $mc)";;
        generic)   msg="$msg ($mc)" ;;
        *)
        ;;
    esac
    command="git add $tgt && git commit -m \"$msg\""
    echo "$command"
    eval "$command"
}

initial()  {
    vg initial $* "noop"
}

minor()    {
    vg minor $* "noop"
}

gitsync()  {
    vg sync $* "noop"
}

polish()   {
    vg polish $* "noop"
}

refactor() {
    vg refactor $* "noop"
}

fix()      {
    vg fix $*
}

feat()     {
    vg feat $*
}

generic()  {
    vg generic $*
}

move()     {
    vg move $*
}

alias gg='generic'

gitSyncForCommuting() {
    gitchdirintoroot && git add . && git commit -m 'periodic sync' && git push
}

amend() {
    git commit --amend --no-edit
}

gitcommutecheck() {
    TYPE=$(uname)
    if [ "${TYPE}" = "Linux" ]; then 
        gittestforcommuting ~/projects --from 100
        gittestforcommuting ~/dotfiles --exact --from 100
    elif [ "${TYPE}" = "Darwin" ]; then
        gittestforcommuting ~/development/github ~/development/stforge --from 100
        gittestforcommuting ~/dotfiles --exact --from 100
    else
        echo "Unsupported OS - ${TYPE}";
    fi
}

gitcommutepush() {
    TYPE=$(uname)
    if [ "${TYPE}" = "Linux" ]; then 
        gittestforcommuting ~/projects --push --from 100
        gittestforcommuting ~/dotfiles --exact --push  --from 100
    elif [ "${TYPE}" = "Darwin" ]; then
        gittestforcommuting ~/development/github ~/development/stforge --push --from 100
        gittestforcommuting ~/dotfiles --exact --push  --from 100
    else
        echo "Unsupported OS - ${TYPE}";
    fi
}



gi() {
    echo "$1" >> ./.gitignore
}

gitignoreedit() {
    vi "$(git root)/.gitignore"
}

gitchdirintoroot() {
    pushd "$(git rev-parse --show-toplevel)"
}

overleafstartedit() {
    echo "We are now going to fetch the current version of the paper from the overleaf repository."
    echo "to finish type: overleafstopedit"
    git pull overleaf master
}

overleafstopedit() {
    echo "Pushing towards private github repo"
    git push
    echo "Pushing towards overleaf"
    git push overleaf master
}
