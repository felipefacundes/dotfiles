#!/bin/bash
#export PCIE_BDF_IDENT='01:00.0'
export PCIE_BDF_IDENT='00:02:0'
echo 1 > /sys/bus/pci/devices/0000\:"${PCIE_BDF_IDENT}"/rom
cat /sys/bus/pci/devices/0000\:"${PCIE_BDF_IDENT}"/rom > \
    gpu-"$(date +%Y%m%dT%H%m%S)".rom
echo 0 > /sys/bus/pci/devices/0000\:"${PCIE_BDF_IDENT}"/rom
