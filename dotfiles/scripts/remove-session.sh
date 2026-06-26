#!/usr/bin/env bash

session=$(
  {
    tmux list-session -F "#{session_name}"
  } | fzf
)

[ -z "$session" ] && exit 0

tmux kill-session -t "$session"

