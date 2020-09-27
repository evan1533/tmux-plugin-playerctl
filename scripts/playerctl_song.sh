#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

main() {
    # local player_to_use = $(spotify_or_playerctl)
    # if [[ $player_to_use == "spotify" ]]
    # then
    #     print_current_property --songshort
    # else
    #     playerctl metadata title
    # fi
    playerctl metadata title
}

main
