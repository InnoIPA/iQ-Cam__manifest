# Change Logs
## v1.1.4
### New Features
- Update GitHub Actions workflows to support automatic synchronization to the public repository.
- Add documentation for public repository synchronization.
- Add `DEVELOPMENT.md` for developer guidelines.

## v1.1.3
### New Features
- Add colorbar mode for EV8M-OOM1

## v1.1.2
### New Features
- Add colorbar mode for EV2M-OOM3

## v1.1.1
### Supported Platform
- EXMA-Q911 (`Yocto QLI 1.7`) (V4L2 only, chicdk is not support)

### New Features
- On EXMA-Q911, under the Generic I2C / V4L2 / CAMSS architecture, the EV2M-OOM3 has been successfully brought up.
It currently supports 1920×1080 @ 30 fps, and up to 4 streams can run simultaneously.

## v1.1.0
### Supported Platform
- IQ-9075-EVK (`Yocto QLI 1.6`/`Ubuntu 24.04 (x07)`)
- EXMP-Q911 (`Yocto QLI 1.6`/`Ubuntu 24.04 (x07)`)

### Newly Supported Modules
- EV3F-ZSM1
    - PP19 (D-PHY):
        - Available ports: JCAM 0/1/2/3
        - Available link: A/B/C/D
        - 1920x1536 @ 30 FPS
- EV8M-OOM1
    - Available ports: JCAM 0/1/2/3
    - 1920x1080 @ 30 FPS

### New Features
- EVDF-OOM1 now supports Link B/C/D
- ***EVDF-OOM1*** and ***EV3F-ZSM1*** support up to 8 channels
- Upgraded from ***QLI 1.5*** to ***QLI 1.6*** (***QLI 1.5*** is no longer supported)

## v1.0.0
### New support platform
- IQ-9075-EVK (`Yocto Linux 1.5`/`Ubuntu 24.04`)
- Q911 (`Yocto Linux 1.5`/`Ubuntu 24.04`)
### New support modules
- EVDF-OOM1
    - PP19 (D-PHY):
        - Available ports: JCAM 0/1/2/3
        - Available link: A
        - 1 channel, 1920x1080, 30 FPS
    - Mezzanine Board (C-PHY):
        - Available ports: Port 2
        - Available link: C
        - 1 channel, 1920x1080, 30 FPS
- ox03f10 (bayer)
    - PP19 (D-PHY):
        - Available ports: JCAM 0/1/2/3
        - Available link: A
        - 1 channel, 640x480, 30 FPS
- EVDM-OOM1
    - Available ports: JCAM 0/1/2/3
    - 1 channel, 1920x1080, 30 FPS
- EV2M-OOM3
    - Available ports:  JCAM 0/1/2/3,
    - 1 channel, 1920x1080, 30 FPS