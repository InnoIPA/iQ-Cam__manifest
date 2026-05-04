To deploy the camera drivers and configuration, follow these steps:
1. Copy the `.tar.gz` release package to the target platform:
    
    ```bash
    scp release/<os_name_version>/<module_name>.tar.gz <target_ip>:/home/root/
    ```
    
2. Install the package based on your operating system and reboot:

    - Yocto Linux 1.6
        1. Remount the filesystem as read-write and install the `.tar.gz` file:
            
            ```bash
            mount -o rw,remount /usr
            tar -xzvf <module_name>.tar.gz -C /usr/lib/camera
            reboot
            ```
    
    - Ubuntu 24.04 (x07)
        1. Configure the package sources for version x07:
            ```bash
            sudo sed -i 's|URIS: https://ppa.launchpadcontent.net/ubuntu-qcom-iot/qcom-ppa/ubuntu|URIS: https://ppa.launchpadcontent.net/ubuntu-qcom-iot/qcom-ppa-snapshot-x07/ubuntu|' /etc/apt/sources.list.d/ubuntu-qcom-iot-ubuntu-qcom-ppa-noble.sources
            ```
        2. Update the system and install the required samples:
            ```bash
            sudo apt update -y && sudo apt upgrade -y
            sudo apt install gstreamer1.0-qcom-sample-apps -y
            ```
        3. Extract the release package to the camera library directory:
            ```bash
            sudo tar -xzvf <module_name>.tar.gz -C /usr/lib/camera
            sudo reboot
            ```