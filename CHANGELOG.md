# Change Logs
## v2.0.0
### Supported Platform
- Upgraded to `Yocto QLI 1.8`; dropped Ubuntu and MZB build targets.
- Dropped iQ-9075 EVK; EXEC-Q911 is now the only documented evaluation kit.

### New Features
- Add `fw2xml` converter: AP1302 bootdata firmware → CHI-CDK `initSettings` XML.
- Refresh AP1302 bootdata payload and probe sequence for EV8M-OOM1.

### Changes
- Merge `generate.sh` into `build.sh`; `release.sh` renamed to `build.sh`.
- Refresh release tarballs for all camera modules; drop stale `yocto_1.6` artifacts.

### Fixed
- Remove stale AP1302 `0x7A` POLL from GMSL probe sequence for EVDF-OOM1.

### Documentation
- Add browsable HTML porting guide site under `doc/porting_guide/`.
- Remove iQ-9075 EVK connection guides, support tables, and images from all documentation.

## v1.1.6
### Infrastructure
- `sync-to-public.yml` clears `public-repo/release/*` before copying so removed tarballs drop from the public mirror.

### Developer Tooling
- Add `build_deploy_test.sh`: end-to-end build, deploy, and GStreamer capture check.
- Add Claude Code workflow skills under `.claude/skills/` and a project-level `CLAUDE.md`.

### Documentation
- Import vendor reference docs under `doc/reference/` (Qualcomm 1.6/1.8 Camera Guide, GMSL2, MAX96724, MAX9295D).
- Add a known-good QLI 1.6 `ev3f_zsm1_pp19_linkA` baseline for diffing against failing runs.
- Add `doc/common/verify.md` for the post-deploy capture check.

## v1.1.5
### Changes
- Remove Ubuntu support from documentation (faq, gmsl, install, mipi guides)
- Update BSP support section in README
- Remove expired and broken release packages for Yocto 1.8 and Ubuntu x07

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