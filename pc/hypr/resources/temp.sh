#!/bin/bash

if [ "$(pgrep hyprsunset)" ]; then
  killall hyprsunset 
else
  hyprsunset -t 4800 &
fi
