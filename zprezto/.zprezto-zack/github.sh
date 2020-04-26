
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
        improve)   msg="improve: $msg ($mc)" ;;
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

improve()    {
    vg improve $*
}

gsync()    {
    vg sync $*
}

polish()   {
    vg polish $* "noop"
}

refactor() {
    vg refactor $* "noop"
}

fix()      {
    vg fix . "$*"
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

m() {
    vg update . "minor changes"
}

u() {
    vg update . "$*"
}

move()     {
    vg move $*
}


,git-amend() {
    git commit --amend --no-edit
}

,git-sync-commute() {
    if [ "$1" = "-h" ]; then
            echo "Options: "
            echo " --push,        push changes to remote (suggested) "
            echo " --pull,        pull changes from remote "
            echo " (none),        just check"
    else 
            TYPE=$(uname)
            if [ "${TYPE}" = "Linux" ]; then
                JSONNAME="/Users/zaccaria/dotfiles/git-verify-sync-linux.json"
            elif [ "${TYPE}" = "Darwin" ]; then
                JSONNAME="/Users/zaccaria/dotfiles/git-verify-sync-mac.json"
            else
                echo "Unsupported OS - ${TYPE}";
            fi
            git-verify fup ${JSONNAME} $1
    fi
}


,gi() {
    echo "$*" | tr ' ' '\0' | xargs -0 -n 1 -I {} echo {} >> ./.gitignore
}

alias ,ga='git add'
alias ,gcu=',git-sync-commute --push'
alias ,gd='git diff --color-words'
alias ,gs='git status'
alias ,s='git status'
alias ,gb='git branch'
alias ,gsb='git checkout '
alias ,gl="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

alias ,git-untrack='git update-index --assume-unchanged '
alias ,git-show-last-commit-of="git whatchanged -n 1 -p"
alias ,git-grep-all-commits='git log --source --all -S '
alias ,git-show-when-file-added='git log --diff-filter=A --'

,git-browse-commit-id() {
    hub browse -- commit/$1
}

,git-diff-to-html() {
    git diff --color=always $* | diff-so-fancy | aha
}
