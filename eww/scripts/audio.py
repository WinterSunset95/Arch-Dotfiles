#!/usr/bin/python

import subprocess
import os
import sys
from time import sleep

# Using playerctl, get the current playing song
def getCurrentSong():
    try:
        # Get the current playing song
        song = subprocess.check_output(["playerctl", "metadata", "title"]).decode("utf-8").strip()
        artist = subprocess.check_output(["playerctl", "metadata", "artist"]).decode("utf-8").strip()
        if artist == "":
            artist = "Unknown"
        return f"{song} ({artist})"
    except:
        return ""

while True:
    getSong = getCurrentSong()
    subprocess.run(f"echo '{getSong}'", shell=True)
    sleep(1)
