#!/bin/bash

echo "$(/usr/sbin/ifconfig wlan0 | grep "inet " | awk '{print $2}')"
