#!/bin/bash

# Start waybar
waybar &

# Kill and restart waybar when the config file is changed
while inotifywait -e modify ./style.css; do
	killall -r waybar
	waybar &
done
