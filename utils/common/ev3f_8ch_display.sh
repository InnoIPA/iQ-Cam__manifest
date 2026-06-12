#!/bin/bash

echo "HMSMaxDelayedJobCount=8" > /var/cache/camera/camxoverridesettings.txt

pkill cam-server && sleep 15 &&
GST_GL_API=gles2 XDG_RUNTIME_DIR=/dev/socket/weston WAYLAND_DISPLAY=wayland-1 \
gst-camera-per-port-example --custom <<EOF
1 0 2 3 5 4 6 7
1
1920
1536
30
1
1920
1536
30
1
1920
1536
30
1
1920
1536
30
1
1920
1536
30
1
1920
1536
30
1
1920
1536
30
1
1920
1536
30
qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc1 camera=1 ! video/x-raw,format=NV12,width=1920,height=1536,framerate=30/1 ! videoconvert ! videoscale ! video/x-raw,width=480,height=384 ! fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true
qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc0 camera=0 ! video/x-raw,format=NV12,width=1920,height=1536,framerate=30/1 ! videoconvert ! videoscale ! video/x-raw,width=480,height=384 ! fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true
qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc2 camera=2 ! video/x-raw,format=NV12,width=1920,height=1536,framerate=30/1 ! videoconvert ! videoscale ! video/x-raw,width=480,height=384 ! fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true
qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc3 camera=3 ! video/x-raw,format=NV12,width=1920,height=1536,framerate=30/1 ! videoconvert ! videoscale ! video/x-raw,width=480,height=384 ! fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true
qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc5 camera=5 ! video/x-raw,format=NV12,width=1920,height=1536,framerate=30/1 ! videoconvert ! videoscale ! video/x-raw,width=480,height=384 ! fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true
qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc4 camera=4 ! video/x-raw,format=NV12,width=1920,height=1536,framerate=30/1 ! videoconvert ! videoscale ! video/x-raw,width=480,height=384 ! fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true
qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc6 camera=6 ! video/x-raw,format=NV12,width=1920,height=1536,framerate=30/1 ! videoconvert ! videoscale ! video/x-raw,width=480,height=384 ! fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true
qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc7 camera=7 ! video/x-raw,format=NV12,width=1920,height=1536,framerate=30/1 ! videoconvert ! videoscale ! video/x-raw,width=480,height=384 ! fpsdisplaysink video-sink=glimagesink sync=false text-overlay=true
EOF