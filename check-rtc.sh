#!/bin/sh

# check-rtc.sh
# Check operation of RTC and compare with system date.

# ORIGIN: 2021-04-24 by hmr

DATE1=$(date +"%Y-%m-%d %H:%M:%S       +09:00")
HWCLOCK=$(sudo hwclock -r)
# DATE2=$(date +"%Y-%m-%d %H:%M:%S       +09:00")

echo "SYSTEM: ${DATE1}"
echo "H/WRTC: ${HWCLOCK}"
# echo "DATE2=${DATE2}"

