
echo "This script will setup vnc from scratch"
echo ""
echo "* creating .vnc directory"
mkdir -p /root/.vnc

echo "* creating vnc file"
cat > /root/.vnc/xstartup <<EOF
#!/bin/sh

xrdb $HOME/.Xresources
startxfce4 &
EOF

chmod +x /root/.vnc/xstartup

xfconf-query -c xfce4-keyboard-shortcuts -p /xfwm4/custom/'<'Super'>'Tab -r

cat <<EOF
* Ok - done, useful commands to remember:

  USER=root vncserver -depth 16 -geometry 1920x1200 # to run it
  USER=root vncserver -kill :1 # to kill it

* To launch from mac

  open /System/Library/CoreServices/Screen\ Sharing.app

  using QNAPIP:5901 as address, or open vnc://192.168.1.120:5901

* I'm finished.
EOF
