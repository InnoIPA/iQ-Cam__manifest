# How to Verify

If the file `/var/cache/camera/camxoverridesettings.txt` does not exist, please create it and add the following configuration:
```bash
HMSMaxDelayedJobCount=8
```

After connecting to the device, use the following command to verify whether the camera is functioning properly:

```bash
pkill cam-server && sleep 5 && timeout 4 gst-launch-1.0 qtiqmmfsrc exposure-mode=off manual-exposure-time=10000000000 name=camsrc0 camera=0 ! \
video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! videoconvert ! \
queue ! pngenc ! multifilesink location="./test.png"
```

If the camera is working correctly, a `test.png` file will be generated.

> **Note:** If you are using the `ev3f-zsm1` module, the `height` parameter must be changed to `1536`.
