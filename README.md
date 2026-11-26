# iQ-Cam

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="doc/common/brand/iQ-badge-white-cam.svg">
    <img src="doc/common/brand/iQ-badge-ink-cam.svg" alt="iQ-Cam" width="160">
  </picture>
</p>

<h2 align="center"><em>Download, Deploy, Camera Ready.</em></h2>


<h3 align="center">Pre-built camera module packages for Innodisk Qualcomm Dragonwing platforms: download a package, deploy it to your device, and start streaming.</h3>

> [!NOTE]
> iQ-Cam supports only Innodisk platforms based on Qualcomm Dragonwing SoCs (currently EXEC-Q911). Qualcomm reference kits, such as the IQ-9075 EVK, are not supported.

iQ-Cam provides ready-to-install camera driver packages that run Innodisk MIPI and GMSL camera modules on Innodisk Qualcomm Dragonwing platforms. Each module ships as a pre-built `.tar.gz` package in the `release/` directory. Copy the package to your device, extract it into the camera driver directory, and the camera is ready to use. You don't need to build anything.

![camera_family](doc/common/pic/camera_family.jpg)

## BSP Support

This repo supports the following Q911 BSP versions (from the [meta-iQ__manifest](https://github.com/InnoIPA/meta-iQ__manifest) repository):

| BSP Version | QLI version | iQ-Cam Version         | Tested                                                      |
| ----------- | ----------- | ---------------------- | ----------------------------------------------------------- |
| **v2.1.0**  | v1.6        | v1.1.4, v1.1.5, v1.1.6 | ✅                                                          |
| **v2.3.0**  | v1.8        | -                      | -                                                           |
| **v2.3.1**  | v1.8        | -                      | -                                                           |
| **v2.3.2**  | v1.8        | v2.0.0                 | ✅                                                          |
| **v2.3.3**  | v1.8        | -                      | -                                                           |
| **v2.5.0**  | v2.0        | v3.0.0                 | ✅ [report](doc/common/test_summary/test_summary_v3.0.0.md) |

> **Note:** Although **v2.3.0**, **v2.3.1**, and **v2.3.3** have not been explicitly tested, they are all based on QLI 1.8, so they should work without issues.


## Supported Interfaces

### [MIPI Camera](doc/common/mipi.md)
MIPI CSI-2 is a widely adopted, high-bandwidth, and low-latency interface ideal for short-range connections between image sensors and the processor.

- **Best for:** Edge AI devices, robotics, industrial automation, and scenarios where cameras are physically close to the processing board.
- **Key Features:** Multi-gigabit throughput, low power consumption, and broad sensor compatibility.
- **Documentation:** [Read the MIPI Camera Guide](doc/common/mipi.md)

### [GMSL Camera](doc/common/gmsl.md)
Gigabit Multimedia Serial Link (GMSL) is a robust interface that allows high-speed video transmission over single coaxial cables for long distances (up to 10–15 meters).

- **Best for:** Autonomous driving, 360° surround-view stitching, industrial mobile equipment, and scenarios requiring cameras to be placed several meters away from the platform.
- **Key Features:** Long-distance transmission, high reliability, and excellent multi-channel real-time support.
- **Documentation:** [Read the GMSL Camera Guide](doc/common/gmsl.md)

---

> 💡 **Need help choosing?**
> - If your cameras will be mounted directly on or very close (within a few tens of centimeters) to the main board, **[MIPI](doc/common/mipi.md)** is the standard choice.
> - If you need to place cameras far away from the system or are using long coaxial cables, **[GMSL](doc/common/gmsl.md)** is the required solution. 

## Release Notes
| Version | Key Changes |
| :--- | :--- |
| **v3.0.0** | Updated all module drivers to QLI 2.0; added frame sync mode for EVDF-OOM1 and EV3F-ZSM1; added automated testing and test reports. |
| **v2.0.0** | Upgraded to Yocto QLI 1.8 (dropped Ubuntu and MZB targets); fixed EVDF-OOM1 GMSL probe sequence; added HTML porting guide site; removed iQ-9075 EVK from documentation — EXEC-Q911 is now the only documented evaluation kit. |
| **v1.1.6** | Added `build_deploy_test.sh` end-to-end build/deploy/capture script and Claude Code workflow skills; imported vendor reference docs (Qualcomm 1.6/1.8 Camera Guide, GMSL2, MAX96724, MAX9295D); added EV3F-ZSM1 PP19 known-good baseline and `doc/common/verify.md`; public-mirror sync now clears `release/*` before copying. |
| **v1.1.5** | Removed Ubuntu support from documentation; updated BSP support section; removed expired release packages. |
| **v1.1.4** | Updated GitHub Actions workflows for automatic public repository synchronization; added `DEVELOPMENT.md`. |
| **v1.1.3** | Added colorbar mode for EV8M-OOM1. |
| **v1.1.2** | Added colorbar mode for EV2M-OOM3. |
| **v1.1.1** | Added support for EXMA-Q911 (QLI 1.7) and bring up EV2M-OOM3 on Generic I2C/V4L2. |
| **v1.1.0** | Upgraded to QLI 1.6; added support for EV3F-ZSM1 and EV8M-OOM1; supported 8 channels for GMSL. |
| **v1.0.0** | Initial release with support for EVDF-OOM1, ox03f10, EVDM-OOM1, and EV2M-OOM3. |

## Release Packages
The `release/` directory contains all generated .tar.gz files, which can be installed on compatible devices.
Below is the list of available release packages:

| Module Name                                                                                                                                                   | Phy Type | Support Resolution |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------------ |
| [ev2m_oom3](https://www.innodisk.com/en/products/camera/mipi-csi-2/ev2m-oom3-rhcf)                                                                            | DPHY     | `1920x1080,30FPS`  |
| [ev8m_oom1](https://www.innodisk.com/en/products/camera/mipi-csi-2/ev8m-oom1-rhcf)                                                                            | DPHY     | `1920x1080,30FPS`  |
| [evdm_oom1](https://www.innodisk.com/en/products/camera/mipi-csi-2/evdm-oom1-rhcf)                                                                            | DPHY     | `1920x1080,30FPS`  |
| [ev3f_zsm1](https://www.innodisk.com/en/products/camera/gmsl2/ev3f-zsm1-rxcf)_[pp19](https://www.innodisk.com/en/products/camera/adapter-board/eb022-2m4f)    | DPHY     | `1920x1536,30FPS`  |
| [ev3f_zsm1](https://www.innodisk.com/en/products/camera/gmsl2/ev3f-zsm1-rxcf)_[pp19](https://www.innodisk.com/en/products/camera/adapter-board/eb022-2m4f)_fs | DPHY     | `1920x1536,30FPS`  |
| [evdf_oom1](https://www.innodisk.com/en/products/camera/gmsl2/evdf-oom1-rhcf)_[pp19](https://www.innodisk.com/en/products/camera/adapter-board/eb022-2m4f)    | DPHY     | `1920x1080,30FPS`  |
| [evdf_oom1](https://www.innodisk.com/en/products/camera/gmsl2/evdf-oom1-rhcf)_[pp19](https://www.innodisk.com/en/products/camera/adapter-board/eb022-2m4f)_fs | DPHY     | `1920x1080,30FPS`  |

> **Note - Frame Sync:** The `_fs` packages enable frame sync mode for multi-camera capture. Single-camera still capture is a known limitation of these packages (see the [v3.0.0 test report](doc/common/test_summary/test_summary_v3.0.0.md)), so use the non-FS package of the same module when you only need one camera.

### Download

You can get the packages in two ways:

- **Clone the whole repository** to get every package at once:

    ```bash
    git clone https://github.com/InnoIPA/iQ-Cam__manifest.git
    cd iQ-Cam__manifest/release
    ```

- **Download a single package:** open the package in [`release/`](https://github.com/InnoIPA/iQ-Cam__manifest/tree/main/release) on GitHub and click **Download raw file**. You can also fetch it from the command line with the raw file URL:

    ```bash
    # wget
    wget https://raw.githubusercontent.com/InnoIPA/iQ-Cam__manifest/main/release/ev2m_oom3.tar.gz

    # curl
    curl -LO https://raw.githubusercontent.com/InnoIPA/iQ-Cam__manifest/main/release/ev2m_oom3.tar.gz
    ```

    Replace `ev2m_oom3.tar.gz` with the package for your camera module.

To deploy the package to your device, follow the [Installation Guide](doc/common/install.md).


## License
This project is licensed under the terms specified in the [LICENSE](LICENSE) file.