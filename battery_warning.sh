#!/usr/bin/env bash

# Function to check if there's an existing Zenity dialog with "Low Battery Warning" or "High Battery Warning" title
isZenityDialogOpen() {
  wmctrl -l | grep 'Battery is discharging!\|Battery is charged!' > /dev/null
}

# Run forever
while true; do
  # Check if any Zenity dialog is currently open
  while isZenityDialogOpen; do
    # If so, wait until it closes before proceeding
    sleep 5
  done

  # Get battery level
  battery=$(cat /sys/class/power_supply/BAT0/capacity)

  # Get charging adapter status
  adapter=$(cat /sys/class/power_supply/ADP0/online)

  # Low battery warning
  if [[ "$battery" -lt 25 && "$adapter" == "0" ]]; then
    zenity --warning \
      --title="The battery is discharging!" \
      --text="Battery charge is at ${battery}%! Plug in the charger." \
      --ok-label="OK."
  elif [[ "$battery" -gt 80 && "$adapter" == "1" ]]; then
    zenity --warning \
      --title="The battery is charged!" \
      --text="Battery charge is at ${battery}%! Unplug the charger." \
      --ok-label="OK."
  fi

  # Wait for 2 minutes (in seconds)
  sleep 120
done

