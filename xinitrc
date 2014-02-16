#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
xrdb -load ~/.Xresources &
#xsetroot -solid "#002b36"
/usr/bin/setxkbmap -option "ctrl:swapcaps"
#/usr/bin/xcalib -v ~/Stuff/TPLCD.ICM
#nm-applet &
#exec i3 -V >> ~/.i3/i3log 2>&1
exec gnome-session #--session=gnome-wayland
