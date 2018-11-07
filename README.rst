Zynq Random Generators
----------------------

Includes:
   * inverter chain PUF

#. **Run build.sh in tools directory to get BOOT.bin.**
#. **Build kernel uImage and dtb.**

   * copy zybo.config to linux-xlnx: ``cp configs/zybo.config linux/xlnx/.config``
   * in linux-xlnx compile kernel: ``make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-``
   * create uImage: ``make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- UIMAGE_LOADADDR=0x8000 uImage``
   * compile devictree: ``./scripts/dtc/dtc -I dts -O dtb arch/arm/boot/dts/zynq-zybo.dts -o devicetree.dtb``
      
#. **Get rootfs of your choice.**
#. **Load and run everything on a prepared SD card:**

   * copy uImage, BOOT.bin and devictree.dtb to BOOT/ partition
   * copy rootfs to ROOTFS/ partition

If you want to update something in u-boot, please copy the compiled u-boot binary to backup directory or change system.bif file.
