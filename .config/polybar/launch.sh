#!/bin/bash

# Kill all polybar instances
killall -q polybar

# Wait the process to be shut down
while pgrep -u $UDI -x polybar >/dev/null; do sleep 1; done

# Launch polybar default config location in ~/.config/polybar/config
polybar bar &

echo "Polybar launched ..."

