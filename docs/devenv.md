# Remote development environment

## Using X11

First, open X11 locally with

``` shell
devenv-ssh-start
devenv-ssh-openx11
```

then from anywhere:

``` shell
ssh -X root@localhost -p 2222
```

once connected

    export DISPLAY=192.168.1.X:0
    
where X is can be selected with the command `ip-show-all-local`

You can then open any remote GUI program locally.

## Using Docker and VNC / Startup

Run the following command:

    devenv-vnc-start

It launches the container and runs vnc with `docker exec`. When setup is
finished then open vnc://localhost:5901 or `devenv-vnc-open`
