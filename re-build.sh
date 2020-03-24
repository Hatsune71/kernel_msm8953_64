VERSION="Miku-Kernel-G.0.1"
make clean && make mrproper
export ARCH=arm64
export CROSS_COMPILE=~/tool/bin/aarch64-linux-android-
mkdir output
make -C $(pwd) O=output Miku_ysl_defconfig
make -j3 -C $(pwd) O=output
cp -r output/arch/arm64/boot/Image.gz-dtb zip/
cd zip
mv Image.gz-dtb zImage 
zip -r Miku-G.0.1.zip *
