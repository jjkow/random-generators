#!/bin/bash

if [[ $VIVADO_PATH == "" ]]; then
    echo "Please set VIVADO_PATH to the directory with settings64.sh."
    exit
fi

source $VIVADO_PATH/settings64.sh

# Build BOOT.bin

vivado -mode batch -source build.tcl
cp `find -name *.sysdef` hardware.hdf
mkdir -p SDK
hsi -source fsbl.tcl
cp SDK/executable.elf FSBL.elf
bootgen -image system.bif -w -o BOOT.bin
