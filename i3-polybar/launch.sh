#!/bin/env bash

# Terminate already running bars
killall -q polybar

# Wait until bars have been terminated
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bottom &
  done
else
  polybar --reload bottom &
fi
