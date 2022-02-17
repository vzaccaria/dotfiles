#!/bin/bash 

set -e 

CURD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
command="$1"
name="$2"
lport="$3"

if [ "${command}" = "build" ]; then 
        docker build -f devenv-${name}.Dockerfile -t devenv-${name}-latest .
elif [ "${command}" = "gui-start" ]; then 
        img=$(docker run -dt -v ${CURD}:/local -p ${lport}:5900 --privileged devenv-${name}-latest)
elif [ "${command}" = "connect" ]; then 
        docker run -ti --privileged -v ${CURD}:/local devenv-${name}-latest
elif [ "${command}" = "gui-open-local" ]; then 
        /Applications/TigerVNC\ Viewer\ 1.12.0.app/Contents/MacOS/TigerVNC\ Viewer -SecurityTypes VncAuth ::${lport}
fi
