#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"


main() {
    # first check if mps-youtube is playing
    # if check_playerctl_sessions "mps-youtube"
    # then
        playerctl_status "mps-youtube"
    # fi
}

main
