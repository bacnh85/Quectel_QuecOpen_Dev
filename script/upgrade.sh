#!/bin/sh

adb reboot bootloader
sleep 10

# Upgrade rootfs
fastboot flash system mdm9607-sysfs.ubi
fastboot flash b_system mdm9607-sysfs.ubi

# Upgrade bootloader
#fastboot flash boot mdm9607-boot.img
#fastboot flash b_boot mdm9607-boot.img

fastboot reboot
