#!/bin/bash

if [[ $VIVADO_SETTINGS_PATH == "" ]]; then
    echo "Please set VIVADO_SETTINGS_PATH to the settings64.sh."
    exit
fi

source $VIVADO_SETTINGS_PATH

# Build BOOT.bin

vivado -mode batch -source build.tcl
cp `find -name *.sysdef` hardware.hdf
mkdir -p SDK
hsi -source fsbl.tcl
cp SDK/executable.elf FSBL.elf
bootgen -image system.bif -w -o BOOT.bin
