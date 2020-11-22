#!/bin/bash

os_version=$(cat /etc/redhat-release)
kernel_ver=$(uname -r)
#cpu_cores=$(cat /proc/cpuinfo | grep "cpu cores")
phy_cores=$(lscpu | grep "CPU(s): " | sed '/NUMA/d' | sed 's/CPU(s):                //')
vir_cores=$(lscpu | grep "Thread(s) per core:    "| sed 's/Thread(s) per core:    //')
cpu_clock=$(lscpu | grep "CPU MHz:              " | sed 's/CPU MHz:              //')
arch=$(lscpu | grep "Architecture")
ram=$(cat /proc/meminfo | grep "MemTotal" | sed 's/MemTotal:        //' | xargs)
echo "OS VERSION: $os_version"
echo ""
echo "Kernel version: $kernel_ver"
echo ""
echo "Ratio of virtualcore:physicalcore $vir_cores:$phy_cores"
echo ""
echo "CPU Clock: $cpu_clock"
echo ""
echo "$arch"
echo ""
echo "Ram: $ram"
echo ""
echo "Ports and Protocols"
netstat -tulpn
echo ""
echo "Volume"
df -h

