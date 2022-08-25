#!/bin/bash

myTerm=kitty
myEdit=nvim

menu(){
	printf "  Shutdown\n"
	printf "  Reboot\n"
  printf "  Lock\n"
}

main(){
  choice=$(menu | rofi -dmenu -theme-str '@import "power.rasi"'  | cut -d. -f1)

	case $choice in
		# 1)$myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/kitty/; $myEdit kitty.conf";;
		1) poweroff ;;
		2) $myTerm -e sh -c "sleep 0.1 ; reboot";;
		3) slock ;;
  esac
}

main


