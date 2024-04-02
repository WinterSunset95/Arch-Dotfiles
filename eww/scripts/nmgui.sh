#!/bin/bash

# This script is used to start the Network Manager GUI
nm-applet 2>&1 > /dev/null &
stalonetray 2>&1 > /dev/null
killall nm-applet
