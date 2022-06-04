#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x
## Edited by @SamDc73

theme="card_circle"
dir="$HOME/.config/rofi/bin/powermenu"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/$theme"



# Options
shutdown=""
hibernate=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$hibernate\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
		betterlockscreen -l
        ;;
    $suspend)
		playerctl pause
		amixer set Master mute
		systemctl suspend
        ;;
    $logout)
		session=`loginctl session-status | head -n 1 | awk '{print $1}'`
		loginctl terminate-session $session
        ;;
	$hibernate)
		systemctl hibernate
		;;
esac
