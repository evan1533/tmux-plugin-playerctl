#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

main() {
  playing_icon="▶"
  paused_icon="▮▮"

  playerctl_status=$(playerctl status)
  if [[ "${playerctl_status}" == "Playing" ]]
  then
      echo "$playing_icon"
  elif [[ "${playerctl_status}" == "Paused" ]]
  then
      echo "$paused_icon"
  else
      print_current_property --playbackstatus
  fi
}

main
