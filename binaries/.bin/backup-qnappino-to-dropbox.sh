#!/bin/sh

# dryrun
dry_run=true
listLocal=false
listRemote=false

maindrive="/share/CACHEDEV1_DATA/Multimedia"
docker_image="rclone2.0"
lfolder="/opt/dockhost"
rfolder="dropbox:Nas"

# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-hglr] [-i IMAGE] DIR...
Copy/inspect docker based backup into dropbox

    -h          display this help and exit
    -i IMAGE    docker image with rclone [default: ${docker_image}]
    -g          commit actions (otherwise it is a dryrun)
    -l          list source directory
    -r          list destination directory

Arguments:
    DIR         directory in $maindrive to backup
EOF
}

error() {
    printf "\033[1;37m\033[41m %6s \033[0m %s \n" " err  " "$1"
}

info() {
    printf "\033[1;37m\033[44m %6s \033[0m %s \n" " info " "$1"
}

warn() {
    printf "\033[1;37m\033[43m %6s \033[0m %s \n" " warn " "$1"
}

run() {
  info "Running: $1"
  if [ $dry_run = false ] ; then
    eval "$1"
  fi
}

OPTIND=1 # Reset is necessary if getopts was used previously in the script.  It is a good idea to make this local in a function.

while getopts "hglri:" opt; do
    case "$opt" in
        h)
            show_help
            exit 0
            ;;
        i)  docker_image=$OPTARG
            ;;
        g)  dry_run=false
            ;;
        l)  listLocal=true
            ;;
        r)  listRemote=true
            ;;
        '?')
            show_help >&2
            exit 1
            ;;
    esac
done
shift "$((OPTIND-1))" # Shift off the options and optional --.

folder=$1
docker_cmd="docker run -t -v $maindrive/$folder:$lfolder:ro $docker_image"

if [ "$listLocal" = true ]; then
    cmd="$docker_cmd ls -l $lfolder"
else
    if [ "$listRemote" = true ]; then
        cmd="$docker_cmd rclone lsd $rfolder"
    else
        warn "Remember, all command line options (e.g, -g) should go before the directory to backup"
	warn "This backs up only the Multimedia folder."
        if [ -z "$folder" ]; then
            error "You should specify a directory to backup"
            exit 1
        fi
        cmd="$docker_cmd rclone sync $lfolder $rfolder/$folder"
    fi
fi


run "$cmd"
