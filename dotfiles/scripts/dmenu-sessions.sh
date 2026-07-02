#!/usr/bin/env bash

session=$(
  {
    echo "New Session"
    tmux list-sessions -F "#{session_name}" 2>/dev/null
  } | dmenu -p "Session"
)

[ -z "$session" ] && exit 0

if [ "$session" = "New Session" ]; then

  name=$(printf "" | dmenu -p "Session Name")

  [ -z "$name" ] && exit 0

  tmux new-session -ds "$name"

  alacritty -e tmux attach -t "$name"

else
  alacritty -e tmux attach -t "$session"
fi
