

f() {
   find . -name "*$@*"
}

p() {
   ps -fe | grep -v grep | grep "$@" -i --color=auto;
}

c() {
   git cm "$@" && git push --all
}

dock-connect() {
    docker run -i -t $@ /bin/bash
}

