#!/bin/sh
# vim: set ft=sh ff=unix fenc=utf-8 et ts=4 sw=4 :

# disable-rtc.sh
# Disables hardware RTC connected via I2C bus.
#
# AUTHOR: hmr
# ORIGIN: 2020-11-20 03:42:32

# TODO: Check installation of i2c-tools

if [ ! -e /dev/rtc ]; then
    echo "The hardware RTC hasn't been enabled."
    exit 1
fi

echo Disabling Hardware RTC.
echo 0x68 | sudo tee /sys/class/i2c-adapter/i2c-1/delete_device > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo Fail.
    exit 2
fi

sleep 1
if [ -e /dev/rtc ]; then
    echo "Disabling hardware RTC fails."
    exit 3
fi
echo Success.

