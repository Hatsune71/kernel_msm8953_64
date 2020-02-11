echo "Initialize build system...."
echo "[1/7] Cleaning Directory....."
rm -rf ~/tool
rm -rf ~/$(pwd)/output
rm -rf ~/$(pwd)/zip
echo "[2/7] Cloning ToolChain....."
git clone https://github.com/najahiiii/aarch64-linux-gnu.git -b linaro8-20190216 ~/tool
echo "[3/7] Toolchain has been Cloned......"
export ARCH=arm64
export CROSS_COMPILE=~/tool/bin/aarch64-linux-gnu-
echo "[4/7] Mkdir output......"
mkdir output
echo "[5/7] Make Kernel......"
make -C $(pwd) O=output ysl_defconfig
make -j32 -C $(pwd) O=output
echo "[6/7] Copy Image.dtb....."
git clone https://github.com/mahajant99/AnyKernel3.git -b ysl-aosp zip
cp -r output/arch/arm64/boot/Image.gz-dtb zip/
cd zip
mv Image.gz-dtb zImage 
zip -r Miku-Kernel-Test.zip *
echo "[7/7] Finished...."

