#!/usr/bin/python

import subprocess
import os
import socket
import json

def hyprlandWorkspaces():
    def update_workspace(active_workspace):
        openWorkspaces = os.popen("hyprctl workspaces -j").read()
        workspaces = json.loads(openWorkspaces)
        openWorkspaces = [];
        for workspace in workspaces:
            openWorkspaces.append(workspace['id'])
        openWorkspaces.sort()

        startStr = f"(box :class \"workspaces\" :orientation \"h\" :halign \"start\" :spacing 10 "
        middleStr = f""
        endStr = f")"

        for ws in openWorkspaces:
            if ws == active_workspace:
                #currStr = f"(button :class \"active_workspace\" :onclick \"hyprctl dispatch workspace {ws}\" \"\")"
                currStr = f"(button :height \"25\" :class \"active_workspace ws\" :onclick \"hyprctl dispatch workspace {ws}\" \"{ws}\")"
            else:
                #currStr = f"(button :onclick \"hyprctl dispatch workspace {ws}\" \"\")"
                currStr = f"(button :height \"25\" :class \"ws\" :onclick \"hyprctl dispatch workspace {ws}\" \"{ws}\")"
            middleStr = middleStr + currStr
        prompt = f"{startStr}{middleStr}{endStr}"

        subprocess.run(f"echo '{prompt}'", 
                       shell=True)

    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    server_address = f'/tmp/hypr/{os.environ["HYPRLAND_INSTANCE_SIGNATURE"]}/.socket2.sock'
    sock.connect(server_address)

# Before the loop starts we need to first output an initialization message
    activeWs = os.popen("hyprctl activeworkspace -j").read()
    activeWs = json.loads(activeWs)
    activeWs = activeWs['id']
    update_workspace(activeWs)

# The loop will run until the connection is closed
    while True:
        new_event = sock.recv(4096).decode("utf-8")
        for item in new_event.split("\n"):
            if "workspace>>" == item[0:11]:
                workspaces_num = item[-1]
                update_workspace(int(workspaces_num))

def i3Workspaces():
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    server_address = f'{os.environ["I3SOCK"]}'
    sock.connect(server_address)

    while True:
        new_event = sock.recv(4096).decode("utf-8")
        print(new_event)

if os.environ["XDG_SESSION_TYPE"] == "wayland":
    hyprlandWorkspaces()
else:
    i3Workspaces()
