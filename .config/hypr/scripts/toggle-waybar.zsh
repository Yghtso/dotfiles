#!/usr/bin/env zsh

# Find the running Waybar PID
WAYBAR_PID=$(pgrep -x waybar)

if [[ -z $WAYBAR_PID ]]; then
  # If it's not running, launch it
  echo "Starting Waybar..."
  waybar & disown
else
  # Otherwise, send SIGUSR1 to toggle visibility
  echo "Toggling Waybar visibility..."
  kill -SIGUSR1 $WAYBAR_PID
fi

