#!/bin/bash
picom --experimental-backend --daemon &
setxkbmap -layout us,ru -option "grp:alt_shift_toggle" &
sxhkd &
