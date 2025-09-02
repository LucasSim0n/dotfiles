#!/bin/bash

if [ "$(pgrep hyprsunset)" ]; then
  killall hyprsunset 
else
  hyprsunset -t 4300 &
fi
