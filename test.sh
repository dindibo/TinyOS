#!/bin/bash

qemu-system-x86_64 -drive format=raw,file=disk.img -cdrom ./os.iso
