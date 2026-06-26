#!/bin/sh

eww daemon >/dev/null 2>&1 &

# Give it a moment to initialize
sleep 0.2

eww open bar
