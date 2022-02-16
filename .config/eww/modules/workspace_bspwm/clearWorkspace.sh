#!/bin/sh

ranCount=0

# Needlessly deletes the last empty workspace
while read line
do
	[[ $line == "" ]] && break

	bspc desktop $line -r 
	ranCount=$((ranCount))
done <<< $(bspc query -D -d '.!occupied' --names) # Get the empty destops

array=($(bspc query -D --names)) # Command substituion clownery
end=${#array[@]}

end=$((end - ranCount + 1)) # -1 for the empty appended desktop

#echo $end

for ((i=1; i<= end; i++))
do
	list+=($i)	
done

bspc monitor -d ${list[@]} 
#echo ${list[@]}
