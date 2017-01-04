
echo "* creating .vnc directory"
mkdir -p /root/.vnc

echo "* creating vnc file"
cat > /root/.vnc/xstartup <<EOF
#!/bin/sh

xrdb $HOME/.Xresources
startxfce4 &
EOF

cat <<EOF
* Ok - done, useful commands to remember:

  USER=root vncserver -depth 16 -geometry 1920x1200 # to run it
  USER=root vncserver -kill :1 # to kill it

* To launch from mac

  open /System/Library/CoreServices/Screen\ Sharing.app

* I'm finished.
EOF
