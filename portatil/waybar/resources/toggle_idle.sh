#!/bin/bash

if [ "$(pgrep hypridle)" ]; then
  killall hypridle
else
  exec hypridle
fi
