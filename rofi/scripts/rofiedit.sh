#!/bin/bash

myTerm=kitty
myEdit=nvim

menu(){
	printf "1. kitty\n"
	printf "2. alacritty\n"
  printf "3. polybar\n"
  printf "4. nvim\n"
  printf "5. picom\n"
	printf "6. sxhkd\n"
  printf "7. .bashrc\n"
	printf "8. qtile\n"
	printf "9. rofi\n"
	printf "10. fish\n"
	printf "11. quickmarks\n"
}

main(){
    choice=$(menu | rofi -dmenu -theme-str '@import "editConfigs.rasi"'  | cut -d. -f1)

	case $choice in
		1) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/kitty/; $myEdit kitty.conf" ;;
		2) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/alacritty/; $myEdit alacritty.yml" ;;
		3) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/polybar/; $myEdit config.ini" ;;
		4) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/nvim/; $myEdit init.lua" ;;
		5) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/picom/; $myEdit picom.conf" ;;
		6) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/sxhkd/; $myEdit sxhkdrc" ;;
		7) $myTerm -e sh -c "sleep 0.1 ; $myEdit $HOME/.bashrc" ;;
		8) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/qtile/; $myEdit config.py" ;;
		9) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/rofi/; $myEdit config.rasi" ;;
		10) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/fish/; $myEdit config.fish" ;;
		11) $myTerm -e sh -c "sleep 0.1 ; cd $HOME/.config/qutebrowser/; $myEdit quickmarks" ;;
  esac
}

main


