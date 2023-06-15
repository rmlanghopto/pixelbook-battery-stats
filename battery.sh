#! /bin/bash

battery_full=$(sudo ectool battery 2>/dev/null | awk 'NR == 7 {print $4}')
battery_left=$(sudo ectool battery 2>/dev/null | awk 'NR == 12 {print $3}')
battery_cycles=$(sudo ectool battery 2>/dev/null | awk 'NR == 9 {print $3}')
battery_new=$(sudo ectool battery 2>/dev/null | awk 'NR == 6 {print $3}')
battery_health=$(echo "scale=4; ($battery_left / $battery_new) * 100" | bc)
battery_now=$(echo "scale=4; ($battery_left / $battery_full) * 100" | bc)

echo $battery_now | xargs printf "%.0f%% charged \n"
echo $battery_health | xargs printf "%.0f%% healthy \n"
echo $battery_cycles | xargs printf "%d battery cycles \n"
