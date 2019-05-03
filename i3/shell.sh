#!/bin/bash
ID=$(xdpyinfo | grep focus | cut -f4 -d " ")
PID=$(($(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3)))
PID=`pgrep -nP $PID`
if [ -e "/proc/$PID/cwd" ]
then
  gnome-terminal --working-directory=$(readlink /proc/$PID/cwd)
else
  gnome-terminal
fi
