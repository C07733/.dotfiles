#!/bin/sh

contains() {
    for e in $1; do
        [ "$e" -eq "$2" ] && echo 1 && return 
    done
    echo 0
}

print_workspaces() {
listOfDesktops=""
listOfWindows=""

while read desktopData
do	
	listOfDesktops+=("${desktopData:11:1}") # Desktop number
	croppedWindowName="${desktopData:13}"
	
	#echo $newDesktop
	#echo "${croppedWindowName%% *}" # Window name

	listOfWindows+=("${croppedWindowName%% *}")
done <<< $(wmctrl -l -x | tr -s " ") # Get list of desktops and trim spaces

# echo ${listOfDesktops[@]}
# echo ${listOfWindows[@]}

i=1
iEnd=${#listOfDesktops[@]}
biggestY=0
chosenIcon=""

iconizedDesktop=""

while true
do
	if [[ "$i" == "$iEnd" ]]; then
		break
	fi

	y=1
	while read line
	do
		if [[ "${listOfWindows[$i]}" == "${line:2}" ]]; then
			#echo ${line:0:1}\| Found in: $y tries
			if [ $y -gt $biggestY ]; then
				biggestY=$y
				chosenIcon=${line:0:1}
			fi
			break
		fi
		y=$((y + 1))	
		done < ~/Documents/iconList.txt

	if [[ ${listOfDesktops[$i]} != ${listOfDesktops[$((i + 1))]} ]]; then
		if [ $biggestY -eq 0 ]; then
			#echo Z\| No icon found.
			chosenIcon="Z"
		fi
		# echo $biggestY $chosenIcon 
		iconizedDesktop+=($chosenIcon)
		biggestY=0
	fi

	i=$((i + 1))
done

echo ${iconizedDesktop[@]}

#i=1
#end=${#inconizedDesktop[@]}
#while [ "$i" -le "$end" ]; do
  #echo "$i"
#  desktops+=$(($i + 1))
#done

buf=""
desktops=$(bspc query -D --names)
focused_desktop=$(bspc query -D -d focused --names)
occupied_desktops=$(bspc query -D -d .occupied --names)
urgent_desktops=$(bspc query -D -d .urgent --names)

#echo $desktops

for d in $desktops; do
	if [ "$(contains "$focused_desktop" "$d")" -eq 1 ]; then
		ws=$d
		icon="${iconizedDesktop[$d]}"
		class="focused"
	elif [ "$(contains "$occupied_desktops" "$d")" -eq 1 ]; then
		ws=$d
		icon="${iconizedDesktop[$d]}"
		class="occupied"
	elif [ "$(contains "$urgent_desktops" "$d")" -eq 1 ]; then
		ws=$d
		icon="${iconizedDesktop[$d]}"
		class="urgent"
	else 
		ws=$d
		icon="B"
		class="empty"
	fi  
	
	buf="$buf (eventbox :cursor \"hand\" (button :class \"$class\" :onclick \"bspc desktop -f $ws\" \"$icon\"))"
done

    echo "(box :class \"workspaces\" :halign \"center\" :valign \"center\" :vexpand true :hexpand true $buf)"
}

# Listen to bspwm changes
print_workspaces
bspc subscribe desktop node_transfer node_add node_remove | while read -r _ ; do
    print_workspaces
done 




