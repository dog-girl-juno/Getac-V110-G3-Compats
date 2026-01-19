#!/bin/bash

# This script takes the output values from the proprietary output from the monitor-sensor utility and 
# tranlating it as an input value for xrandr and xinput. If you experence any issues with your mouse
# you may need to adjust the Coordinate Transformation Matrix values for the orientation you are experiencing
# difficulty with.

### Set touch monitor ###
# You can check that DISPLAY_NAME value is correct by running the following: xrandr --listactivemonitors
# Check TOUCHSCREEN value by running: evtest

DISPLAY_NAME="eDP-1"
TOUCHSCREEN="eGalax Inc. eGalaxTouch EXC3188-1515-06.00.00"

# Prevent multiple instances
pkill -f "monitor-sensor" 2>/dev/null

# Autorotation and values
monitor-sensor | while read -r line; do
  case "$line" in
    *"normal"*) # Normal Rotation
      xrandr --output $DISPLAY_NAME --rotate normal
      xinput set-prop "$TOUCHSCREEN" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
      ;;
    *"left-up"*) # Rotate Left
      xrandr --output $DISPLAY_NAME --rotate left
      xinput set-prop "$TOUCHSCREEN" "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
      ;;
    *"right-up"*) # Rotate Right
      xrandr --output $DISPLAY_NAME --rotate right
      xinput set-prop "$TOUCHSCREEN" "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
      ;;
    *"bottom-up"*) # Upside down orientation
      xrandr --output $DISPLAY_NAME --rotate inverted
      xinput set-prop "$TOUCHSCREEN" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
      ;;
  esac
done
