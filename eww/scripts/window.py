#!/usr/bin/python

import subprocess
import os
import socket
import json

def hyprlandWorkspaces():
# Create a socket connection to the hyprctl server
# We will make sure that the output is never more than 60 characters
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    server_address = f'{os.environ["XDG_RUNTIME_DIR"]}/hypr/{os.environ["HYPRLAND_INSTANCE_SIGNATURE"]}/.socket2.sock'
    sock.connect(server_address)

# Before the loop starts, first echo out the currently active window
    try:
        currWindow = os.popen("hyprctl activewindow -j").read()
        currWindow = json.loads(currWindow)
        currWindow = currWindow['title']
        if len(currWindow) > 60:
            currWindow = currWindow[:60] + "..."
        subprocess.run(f"echo '{currWindow}'", shell=True)
    except:
        subprocess.run(f"echo 'No active window'", shell=True)

# Infinite loop to keep track of the currently open window
    while True:
        new_event = sock.recv(4096).decode("utf-8")
        for line in new_event.split('\n'):
            if "activewindow>>" in line:
                activeWindow = line.split(",")[1]
                if len(activeWindow) > 60:
                    activeWindow = activeWindow[:60] + "..."
                subprocess.run(f"echo '{activeWindow}'", shell=True)

def i3Workspaces():
    # Create a connection to the socket
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    server_address = f'{os.environ["I3SOCK"]}'
    sock.connect(server_address)
    print(sock)

    while True:
        new_event = sock.recv(4096).decode("utf-8")
        print(new_event)


if os.environ["XDG_SESSION_TYPE"] == "wayland":
    hyprlandWorkspaces()
else:
    i3Workspaces()
