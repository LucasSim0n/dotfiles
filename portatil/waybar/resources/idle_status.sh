#!/bin/bash

if [ "$(pgrep hypridle)" ]; then
  echo "󰈈 "
else
  echo "󰈉 "
fi
