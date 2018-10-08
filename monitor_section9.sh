#!/bin/bash
#### Quick script to return jobs running/ queued on cluster
#### Assumes loaded Slurm
#### Insert section9 username on line below

username=jscheen
count_running=0
count_idle=0
echo "Job composition for user "$username" on [section9]:"

squeue | while read line; do
	user=$(echo $line | awk '{print $4}')
	state=$(echo $line | awk '{print $5}')
	if [ "$user" == "$username" ] && [ "$state" == "R" ]; then
		count_running=$(( count_running + 1 ))
		echo $count_running > tmp_running
	else
		count_idle=$(( count_idle + 1 ))
                echo $count_idle > tmp_idle

	fi
done

running=$(cat tmp_running)
idle=$(cat tmp_idle)

echo "Running jobs: "$running
echo "Idle jobs: "$idle


rm tmp_idle
rm tmp_running
