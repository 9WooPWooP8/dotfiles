#!/bin/bash
#
# a simple dmenu session script 
#
###

DMENU='dmenu -i'
choice=$(echo -e "logout\nshutdown\nreboot\nsuspend\nhibernate" | $DMENU)

case "$choice" in
  shutdown) shutdown -h now & ;;
  reboot) shutdown -r now & ;;
  suspend) systemctl suspend & ;;
  hibernate) systemctl hibernate & ;;
esac
