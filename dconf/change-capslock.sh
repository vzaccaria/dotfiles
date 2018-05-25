# See: https://askubuntu.com/questions/684459/configure-caps-lock-as-altgr-and-arrows-like-in-vim

xmodmap -e "keycode 66 = ISO_Level3_Shift"
# create arrow keys at h,j,k,l
xmodmap -e "keycode  31 = i I i I Up Up"
xmodmap -e "keycode  43 = h H h H Up Up"
xmodmap -e "keycode  44 = j J j J Left Left"
xmodmap -e "keycode  45 = k K k K Down Down"
xmodmap -e "keycode  46 = l L l L Right Right"
