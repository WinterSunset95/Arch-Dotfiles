#!/bin/bash

# Check if the argument is "type" or "ip"
if [ "$1" == "type" ]; then
	# Check if the user is conencted to vpn
	if [ -n "$(ifconfig tun0 2>/dev/null | grep "inet ")" ]; then
		echo ""
	elif [ -n "$(ifconfig eno1 2>/dev/null | grep "inet ")" ]; then
		echo "󰈀"
	elif [ -n "$(ifconfig wlo1 2>/dev/null | grep "inet ")" ]; then
		echo "󰤨"
	else
		echo "󰤭"
	fi
elif [ "$1" == "ip" ]; then
	# Check if the user is conencted to vpn
	if [ -n "$(ifconfig tun0 2>/dev/null | grep "inet ")" ]; then
		# Get the ip address of the vpn
		ip=$(ifconfig tun0 2>/dev/null | grep "inet " | awk '{print $2}')
		echo "$ip"
	elif [ -n "$(ifconfig eno1 2>/dev/null | grep "inet ")" ]; then
		# Get the ip address of the ethernet
		ip=$(ifconfig eth0 2>/dev/null | grep "inet " | awk '{print $2}')
		echo "$ip"
	elif [ -n "$(ifconfig wlo1 2>/dev/null | grep "inet ")" ]; then
		# Get the ip address of the wifi
		ip=$(ifconfig wlo1 2>/dev/null | grep "inet " | awk '{print $2}')
		echo "$ip"
	else
		echo "Not connected"
	fi
else
	echo "Invalid argument"
fi
