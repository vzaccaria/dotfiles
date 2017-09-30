# Remote development environment

## Using X11

First, open X11 locally with

``` shell
devenv-openx11
```

then, paste the output of this cmmand:

``` shell
echo "export DISPLAY=`ip-show-all-local | grep 192.168.1`:0" | pbcopy
```

You can then open any remote GUI program locally.

## Using Docker and VNC / Startup

Run the following command:

    devenv-gui 

When the container is running, type `./startx` and then open
vnc://192.168.1.120:5901

## Using Docker and VNC / Running

Open the following address: vnc://192.168.1.120:5901

## Running a Docker container with a shared dir

You can run a container by sharing a common qnap directory (1) both
locally ($dir) (2) and remotely (3):

      +Local---------+   +Qnap-----------------+      
      |              |   |       +Container--+ |      
    +->$dir(2)       |   |       |           | |      
    | |              |   |       |/Data ----+| |(3)   
    | +--------------+   |       +----------++ |      
    |                    |                  |  |      
    |                    |(1)               |  |      
    +--------------------+./share/.../data<-+  |      
                         +---------------------+

The following command are provided:

``` shell
dockshare-mount $dir ## mounts on $dir
dockshare-run $image ## runs the container with /Data mounted
```
