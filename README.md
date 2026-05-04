![camera_family](doc/common/pic/camera_family.jpg)
# iQ-Cam
iQ-Cam is a project designed to generate CHI-CDK compatible patches for Qualcomm-based camera systems. It provides a modular environment to configure, build, and deploy CHI-CDK patches easily, with utilities for debugging, XML modification, and packaging into .tar.gz.

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
| **v1.1.3** | Added colorbar mode for EV8M-OOM1. |
| **v1.1.2** | Added colorbar mode for EV2M-OOM3. |
| **v1.1.1** | Added support for EXMA-Q911 (QLI 1.7) and bring up EV2M-OOM3 on Generic I2C/V4L2. |
| **v1.1.0** | Upgraded to QLI 1.6; added support for EV3F-ZSM1 and EV8M-OOM1; supported 8 channels for GMSL. |
| **v1.0.0** | Initial release with support for EVDF-OOM1, ox03f10, EVDM-OOM1, and EV2M-OOM3. |

## Release Packages
The `release/` directory contains all generated .tar.gz files, which can be installed on compatible devices.
Below is the list of available release packages:

| Module Name    | Phy Type | Support Resolution | Support OS             | Support Platform         | CSI# (CHI-CDK Slot ID)                                                            |
| -------------- | -------- | ------------------ | ---------------------- | ------------------------ | --------------------------------------------------------------------------------- |
| ev2m_oom3      | DPHY     | `1920x1080,30FPS`  | `Ubuntu_x07` `QLI_1.6` | `IQ_9075_EVK` `Q911_DVT` | `CSI0(20)` `CSI1(21)` `CSI2(22)` `CSI3(23)`                                       |
| ev8m_oom1      | DPHY     | `1920x1080,30FPS`  | `Ubuntu_x07` `QLI_1.6` | `IQ_9075_EVK` `Q911_DVT` | `CSI0(20)` `CSI1(21)` `CSI2(22)` `CSI3(23)`                                       |
| evdm_oom1      | DPHY     | `1920x1080,30FPS`  | `Ubuntu_x07` `QLI_1.6` | `IQ_9075_EVK` `Q911_DVT` | `CSI0(20)` `CSI1(21)` `CSI2(22)` `CSI3(23)`                                       |
| ev3f_zsm1_pp19 | DPHY     | `1920x1536,30FPS`  | `Ubuntu_x07` `QLI_1.6` | `IQ_9075_EVK` `Q911_DVT` | `CSI0(0, 1, 2, 3)` `CSI1(4, 5, 6, 7)` `CSI2(8, 9, 10, 11)` `CSI2(12, 13, 14, 15)` |
| evdf_oom1_pp19 | DPHY     | `1920x1080,30FPS`  | `Ubuntu_x07` `QLI_1.6` | `IQ_9075_EVK` `Q911_DVT` | `CSI0(0, 1, 2, 3)` `CSI1(4, 5, 6, 7)` `CSI2(8, 9, 10, 11)` `CSI2(12, 13, 14, 15)` |
| evdf_oom1_mzb  | CPHY     | `1920x1080,30FPS`  | `Ubuntu_x07` `QLI_1.6` | `IQ_9075_EVK`            | `CSI2(8)`                                                                         |

> **Note - Colorbar Mode:** Some release packages are available with a `_colorbar` suffix (e.g., `ev2m_oom3_colorbar`). In this mode, the only difference is that the output image uses a colorbar; all other behavior is the same as the standard mode.


## License
This project is licensed under the terms specified in the [LICENSE](LICENSE) file.