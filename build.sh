#docker run --rm -v /share/source/os-dev/src/:/src kevincharm/i686-elf-gcc-toolchain:5.5.0 bash -c 'cd /src/; make'

# Build bootloader

(cd ./iso/src/boot; make)

# Make ISO
mkisofs -R -input-charset utf8 -b bin/boot.bin -no-emul-boot -boot-load-size 4 -o os.iso iso
