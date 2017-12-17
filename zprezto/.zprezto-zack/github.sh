
# Maybe add an help for all these commands

imap() {
    xargs -0 -n 1 -I {} $*
}

gitchanged() {
    TYPE=$(uname)
    if [ "${TYPE}" = "Linux" ]; then
        git diff --numstat --diff-filter=M "$*" | awk '{printf("%s\0", $3)}' | imap basename {} | paste -s -d, - | sed 's/,/, /g';
    elif [ "${TYPE}" = "Darwin" ]; then
        git diff --numstat --diff-filter=M "$*" | cut -f3 | tr '\n' '\0' | imap basename {} | paste -s -d, - | sed 's/,/, /g';
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
        minor)     msg="minor: changes ($mc)" ;;
        move)      msg="move/delete files";;
        fix)       msg="fix: $msg ($mc)" ;;
        polish)    msg="polish: prettify ($mc)" ;;
        refactor)  msg="refactor: ($mc)";;
        sync)      msg="sync: ($mc)";;
        feat)      msg="feat: $msg (in $mc)";;
        generic)   msg="$msg ($mc)" ;;
        update)    msg="update: $msg ($mc)" ;;
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

update()  {
    vg update $*
}

alias u='update'
ud() {
    update . "$*"
}

fx() {
    fix . "$*"
}

ft() {
    feat . "$*"
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

gitcommutedown() {
    TYPE=$(uname)
    if [ "${TYPE}" = "Linux" ]; then
        git-verify fdown ~/dotfiles/git-verify-sync-linux.json --pull
    elif [ "${TYPE}" = "Darwin" ]; then
        git-verify fdown ~/dotfiles/git-verify-sync-mac.json --pull
    else
        echo "Unsupported OS - ${TYPE}";
    fi
}

gitcommuteup() {
    TYPE=$(uname)
    if [ "${TYPE}" = "Linux" ]; then
        git-verify fup ~/dotfiles/git-verify-sync-linux.json --push
    elif [ "${TYPE}" = "Darwin" ]; then
        git-verify fup ~/dotfiles/git-verify-sync-mac.json --push
    else
        echo "Unsupported OS - ${TYPE}";
    fi
}

gitcommutecheck() {
    TYPE=$(uname)
    if [ "${TYPE}" = "Linux" ]; then
        git-verify fup ~/dotfiles/git-verify-sync-linux.json
    elif [ "${TYPE}" = "Darwin" ]; then
        git-verify fup ~/dotfiles/git-verify-sync-mac.json
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

git-track-origin-master-as-master() {
    git branch --set-upstream-to=origin/master master
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
