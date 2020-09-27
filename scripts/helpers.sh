#!/usr/bin/env bash

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value="$(tmux show-option -gqv "$option")"
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

is_osx() {
  [ "$(uname)" == "Darwin" ]
}

is_linux() {
  [ "$(uname)" == "Linux" ]
}

command_exists() {
  local command="$1"
  type "$command" >/dev/null 2>&1
}

check_playerctl_sessions() {
    res = $(playerctl --player="$1" status)
    if [[ res == "No players found" ]]
    then
        return 1
    else
        return 0
    fi
}

playerctl_status() {
    playerctl --player="$1" status
}

spotify_status() {
    print_current_property --statusshort
}

spotify_status_full() {
    print_current_property --status
}

spotify_print_current_property() {
  if is_linux; then
    spotifycli "$1"
  else
    echo "tmux-plugin-spotify works only on Linux"
  fi
}

player_ctl_players() {
    playerctl -l
}

playerctl_print_current_property() {
  if is_linux && command_exists "playerctl"; then
        playerctl metadata "$1"
  else
    echo "Must have playerctl"
  fi
}
