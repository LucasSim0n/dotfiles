#!/bin/bash
 
ip_address=$(/bin/cat /home/elmago/.config/waybar/resources/target | awk '{print $1}')
machine_name=$(/bin/cat /home/elmago/.config/waybar/resources/target | awk '{print $2}')

if [ $ip_address ] && [ $machine_name ]; then
    echo "$ip_address - $machine_name"
fi
