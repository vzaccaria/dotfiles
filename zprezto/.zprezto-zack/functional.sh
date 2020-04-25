
alias ,functional-shell-help='manmd ~/dotfiles/docs/functional-shell.md'

lift() {
    arg=$1
    opts=${*:2}
    case "${arg}" in
        help)
            ,functional-shell-help
            ;;
        find)
            find . -name "${opts}" -print0
            ;;
        f)
            find . -iname "*${opts}*" -print0
            ;;
        fe)
            find . -iname "*\.${opts}" -print0
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
            echo "Sorry no lift instance available for $1; use 'help' or '-h'"
            ;;
    esac
}



alias ,map='xargs -0 -n 1 -I {}'

,fmap() {
    command=$1
    args=${*:2}
    xargs -0 -n 1 -I {} $command $args | tr '\n' '\0'
}

ag-mdfind() {
    args=${*:1}
    mdfind -onlyin $PWD "kMDItemTextContent == \"$args\"cd"
}
