#!/bin/bash 

set -e 

SRCD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PWD="$(pwd)"
command="$1"
name="$2"
lport="$3"

if [ "${command}" = "build" ]; then 
        docker build -f ${SRCD}/devenv-${name}.Dockerfile -t devenv-${name}-latest ${SRCD}
elif [ "${command}" = "gui-start" ]; then 
        img=$(docker run -dt -v ${PWD}:/local -p ${lport}:5900 --privileged devenv-${name}-latest)
elif [ "${command}" = "connect" ]; then 
        docker run -ti --privileged -v ${PWD}:/local devenv-${name}-latest
elif [ "${command}" = "gui-open-local" ]; then 
        /Applications/TigerVNC\ Viewer\ 1.12.0.app/Contents/MacOS/TigerVNC\ Viewer -SecurityTypes VncAuth ::${lport}
fi
