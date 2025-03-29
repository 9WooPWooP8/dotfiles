#!/usr/bin/env bash

op=$( echo -e " Shutdown\n Reboot\n Suspend\n" | tofi | awk '{print tolower($2)}' )

case $op in 
	shutdown)
		shutdown now
		;;
	reboot)
		shutdown -r now
		;;
	suspend)
		systemctl suspend
		;;
esac
