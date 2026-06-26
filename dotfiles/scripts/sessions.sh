#!/usr/bin/env bash

session=$(
  {
    echo "New Session"
    tmux list-sessions -F "#{session_name}" 
  } | fzf
)


[ -z "$session" ] && exit 0

if [ "$session" = "New Session" ]; then

  read -rp "Session name: " name

  [ -z "$name" ] && exit 0

  tmux new-session -ds "$name"

  if [ -n "$TMUX" ]; then
    tmux switch-client -t "$name"
  else 
    tmux attach -t "$name"
  fi

elif [ -n "$TMUX" ]; then
    tmux switch-client -t "$session"
else
    tmux attach-session -t "$session"
fi
