echo "Initialize build system...."
echo "[1/9] Cleaning Directory....."
rm -rf ~/tool
rm -rf ~/$(pwd)/output
rm -rf ~/$(pwd)/zip
echo "[2/9] Cloning ToolChain....."
git clone https://github.com/najahiiii/aarch64-linux-gnu.git -b linaro8-20190216 ~/tool
echo "[3/9] Toolchain has been Cloned......"
export ARCH=arm64
export CROSS_COMPILE=~/tool/bin/aarch64-linux-gnu-
echo "[4/9] Mkdir output......"
mkdir output
echo "[5/9] Make Kernel......"
make -C $(pwd) O=output ysl_defconfig
make -j32 -C $(pwd) O=output
echo "[6/9] Cloning some stuff...."
git clone https://github.com/mahajant99/AnyKernel3.git -b ysl-aosp zip
echo "[7/9] Stuff cloned..."
cp -r output/arch/arm64/boot/Image.gz-dtb zip/
cd zip
echo "[8/9] copy = image.dtb"
echo "Create Flashable zip"
mv Image.gz-dtb zImage 
zip -r Miku-Kernel-Test.zip *
echo "[9/9] Finished...."

