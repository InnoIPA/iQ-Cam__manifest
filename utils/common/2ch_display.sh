#!/bin/bash

export GST_GL_API=gles2
export XDG_RUNTIME_DIR=/dev/socket/weston 
export WAYLAND_DISPLAY=wayland-1

echo "HMSMaxDelayedJobCount=8" > /var/cache/camera/camxoverridesettings.txt
pkill cam-server && sleep 1 && pkill cam-server && sleep 1

# Cam 0
gst-launch-1.0 qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc0 camera=0 ! \
video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! videoconvert ! \
videoscale ! video/x-raw,width=960,height=540 ! \
fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true &

sleep 1

# Cam 1
gst-launch-1.0 qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc1 camera=1 ! \
video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! videoconvert ! \
videoscale ! video/x-raw,width=960,height=540 ! \
fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true &