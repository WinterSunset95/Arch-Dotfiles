#!/bin/bash

# Maximum brightness
max_brightness=$(brightnessctl max)


# Function returns the current brightness as a percentage
getBrightness () {
	# Get the current brightness
	brightness=$(brightnessctl get)

	# Convert the brightness to percentage
	brightness=$((brightness * 100 / max_brightness))

	echo "$brightness"
}

# Function to set the brightness
# Takes in a number as input and converts it into a brightness value
setBrightness () {
	brightness=$(($1 * max_brightness / 100))

	# Set the brightness
	brightnessctl set $brightness
}

if [ "$1" = "get" ]; then
	getBrightness
elif [ "$1" = "set" ]; then
	if [ -z "$2" ]; then
		echo "Usage: brightness.sh set <value>"
		exit 1
	fi
	setBrightness $2
fi
