#!/bin/bash

# Check if the argument is "type" or "ip"
if [ "$1" == "type" ]; then
	# Check if the user is conencted to vpn
	if [ -n "$(ifconfig | grep tun0)" ]; then
		echo ""
	elif [ -n "$(ifconfig | grep eth0)" ]; then
		echo "󰈀"
	elif [ -n "$(ifconfig | grep wlo1)" ]; then
		echo "󰤨"
	else
		echo "󰤭"
	fi
elif [ "$1" == "ip" ]; then
	# Check if the user is conencted to vpn
	if [ -n "$(ifconfig | grep tun0)" ]; then
		# Get the ip address of the vpn
		ip=$(ifconfig tun0 | grep "inet " | awk '{print $2}')
		echo "$ip"
	elif [ -n "$(ifconfig | grep eth0)" ]; then
		# Get the ip address of the ethernet
		ip=$(ifconfig eth0 | grep "inet " | awk '{print $2}')
		echo "$ip"
	elif [ -n "$(ifconfig | grep wlo1)" ]; then
		# Get the ip address of the wifi
		ip=$(ifconfig wlo1 | grep "inet " | awk '{print $2}')
		echo "$ip"
	else
		echo "No IP address found"
	fi
else
	echo "Invalid argument"
fi
