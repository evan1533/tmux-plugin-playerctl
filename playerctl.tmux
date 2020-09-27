#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

# Spotify Specific Functions
spotify_status="#($CURRENT_DIR/scripts/spotify_status.sh)"
spotify_status_interpolation="\#{spotify_status}"

spotify_status_full="#($CURRENT_DIR/scripts/spotify_status_full.sh)"
spotify_status_full_interpolation="\#{spotify_status_full}"

# spotify_song="#($CURRENT_DIR/scripts/spotify_song.sh)"
# spotify_song_interpolation="\#{spotify_song}"

# spotify_artist="#($CURRENT_DIR/scripts/spotify_artist.sh)"
# spotify_artist_interpolation="\#{spotify_artist}"

# spotify_album="#($CURRENT_DIR/scripts/spotify_album.sh)"
# spotify_album_interpolation="\#{spotify_album}"

# spotify_playback="#($CURRENT_DIR/scripts/spotify_playback.sh)"
# spotify_playback_interpolation="\#{spotify_playback}"

# General Playerctl Functions
playerctl_status="#($CURRENT_DIR/scripts/playerctl_status.sh)"
playerctl_status_interpolation="\#{plyerctl_status}"

playerctl_song="#($CURRENT_DIR/scripts/playerctl_song.sh)"
playerctl_song_interpolation="\#{playerctl_song}"

playerctl_artist="#($CURRENT_DIR/scripts/playerctl_artist.sh)"
playerctl_artist_interpolation="\#{playerctl_artist}"

playerctl_album="#($CURRENT_DIR/scripts/playerctl_album.sh)"
playerctl_album_interpolation="\#{playerctl_album}"

playerctl_playback="#($CURRENT_DIR/scripts/playerctl_playback.sh)"
playerctl_playback_interpolation="\#{playerctl_playback}"

set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

do_interpolation() {
  local string=$1
  # local string=${string/$spotify_status_interpolation/$spotify_status}
  # local string=${string/$spotify_status_full_interpolation/$spotify_status_full}
  # local string=${string/$spotify_song_interpolation/$spotify_song}
  # local string=${string/$spotify_artist_interpolation/$spotify_artist}
  # local string=${string/$spotify_album_interpolation/$spotify_album}
  # local string=${string/$spotify_playback_interpolation/$spotify_playback}

  local string=${string/$spotify_status_interpolation/$spotify_status}
  local string=${string/$spotify_status_full_interpolation/$spotify_status_full}
  local string=${string/$playerctl_status_interpolation/$playerctl_status}
  local string=${string/$playerctl_song_interpolation/$playerctl_song}
  local string=${string/$playerctl_artist_interpolation/$playerctl_artist}
  local string=${string/$playerctl_album_interpolation/$playerctl_album}
  local string=${string/$playerctl_playback_interpolation/$playerctl_playback}
  echo "$string"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
