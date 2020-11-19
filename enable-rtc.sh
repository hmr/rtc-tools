#!/bin/sh
# vim: set ft=bash ff=unix fenc=utf-8 et ts=4 sw=4 :

# enable-rtc.sh
# Enables hardware RTC connected via I2C bus.
#
# AUTHOR: hmr
# ORIGIN: 2020-11-20 03:42:32

# TODO: Check installation of i2c-tools

if [ -e /dev/rtc ]; then
    echo Hardware RTC has been enabled.
    exit 1
fi

echo Enabling Hardware RTC.
echo ds3231 0x68 | sudo tee /sys/class/i2c-adapter/i2c-1/new_device > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo Fail.
    exit 2
fi
echo Success.

sleep 1
echo -n "HW RTC: "
sudo hwclock --show
echo -n "SYSTEM: "
date +"%Y-%m-%d %H:%M:%S       +09:00"

