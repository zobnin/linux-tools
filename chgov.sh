#!/bin/sh

echo $1 | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
