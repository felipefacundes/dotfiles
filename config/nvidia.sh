#!/bin/bash

#nvidia-xconfig --allow-empty-initial-configuration --enable-all-gpus --cool-bits=28 --separate-x-screens [ # nvidia-xconfig - permite-configuração-vazia-inicial-inicial - ative-all-gpus --cool-bits = 28 --separate-x-screens] 

nvidia-smi -pm ENABLED

export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

X :0 &
sleep 5
export DISPLAY=:0
sleep 3

# 1080
nvidia-smi -i 0 -pl 150
nvidia-settings \
    -a "[gpu:0]/GPUFanControlState=1" \
    -a "[fan:0]/GPUTargetFanSpeed=65" \
    -a "[gpu:0]/GPUGraphicsClockOffset[3]=108" \
    -a "[gpu:0]/GPUMemoryTransferRateOffset[3]=-250"

# 1070
nvidia-smi -i 1 -pl 130
nvidia-settings \
    -a "[gpu:1]/GPUFanControlState=1" \
    -a "[fan:1]/GPUTargetFanSpeed=65" \
    -a "[gpu:1]/GPUGraphicsClockOffset[3]=100" \
    -a "[gpu:1]/GPUMemoryTransferRateOffset[3]=-250"
