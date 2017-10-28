
alias lifthelp='manmd ~/dotfiles/docs/functional-shell.md'
alias functionalshellhelp='manmd ~/dotfiles/docs/functional-shell.md'

lift() {
    arg=$1
    opts=${*:2}
    case "${arg}" in
        help)
            lifthelp
            ;;
        find)
            find . -name "${opts}" -print0
            ;;
        f)
            find . -iname "*${opts}*" -print0
            ;;
        fex)
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
