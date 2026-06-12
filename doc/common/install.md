To deploy the camera drivers and configuration, follow these steps.

The release packages are produced as `release/<module_name>.tar.gz` (one per
camera module). They are installed into `/usr/lib/camera` on the target.

## Option A — scripted (recommended)

From the host, with the target connected over `adb`:

```bash
./utils/common/deploy.sh <module_name>      # e.g. ./utils/common/deploy.sh ev2m_oom3
```

`deploy.sh` pushes `release/<module_name>.tar.gz` to the target, remounts `/usr`
read-write, and extracts the tarball into `/usr/lib/camera`. It does not reboot
or run a capture test. (`<module_name>` defaults to `ev2m_oom3` if omitted.)

To build and deploy in one step, use `./utils/build_deploy.sh <module_name>`.

## Option B — manual

1. Push the `.tar.gz` release package to the target over `adb`:

    ```bash
    adb push release/<module_name>.tar.gz /home/root/
    ```

2. Remount the filesystem as read-write, install the package, and reboot:

    ```bash
    adb shell 'mount -o rw,remount /usr'
    adb shell 'tar -xzvf /home/root/<module_name>.tar.gz -C /usr/lib/camera'
    adb shell 'reboot'
    ```
