git clone git://github.com/krasCGQ/aarch64-linux-android - opt-gnu-8.x --depth=1 ~/gcc8
export ARCH=arm64
export CROSS_COMPILE=~/gcc8/bin/aarch64-linux-android-
mkdir output
make -C $(pwd) O=output ysl_defconfig
make -j32 -C $(pwd) O=output
git clone https://github.com/mahajant99/AnyKernel3.git -b ysl-aosp zip
cp -r output/arch/arm64/boot/Image.gz-dtb zip/
cd zip
mv Image.gz-dtb zImage 
zip -r Test-Pie-kernel.zip *
