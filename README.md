GPIO Control Bash Functions using Linux Sysfs Interface
========

## Description
This project consists of:
* GPIO Control Bash Functions using Linux Sysfs Interface
* Sample Bash Script to Blink Two LEDs
* Sample Bash Script to Get Two Switches Status

## Requirement for Raspberry Pi
### Hardware
* [Raspberry Pi](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/)

### Software
* [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)

## Circuit for Sample Bash Script
### Blink Two LEDs
* [Bread Board View](https://goo.gl/photos/MXi4feyE63LPpV7u6)

### Get Two Switches Status
* [Bread Board View](https://goo.gl/photos/YRdA3xzpbyTR4X8S8)

## Sample Bash Script Usage
### Blink Two LEDs
* Must be root to run `LED_Blink.sh`.

    ```console
        $ sudo ./LED_Blink.sh
    ```

### Get Two Switches Status
* Must be root to run `SW_Read.sh`.

    ```console
        $ sudo ./SW_Read.sh
    ```

## Installation
1. Download this repository

    ```console
        $ git clone https://github.com/KeitetsuWorks/GPIO_Linux_Sysfs_Bash.git
    ```

After that you can find Bash script files under the `./GPIO_Linux_Sysfs_Bash/` directory.

## License
* MIT

