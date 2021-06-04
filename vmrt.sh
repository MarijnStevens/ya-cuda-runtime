#!/bin/bash

DISK=docker-ya-cuda-test-img-latest-1f94cdc2a7.gvmi

#./runtime/vmrt \
qemu-system-x86_64 \
        -m 128M \
        -nographic \
        -M q35 \
        -vga none \
        -kernel ./runtime/vmlinuz-virt \
        -initrd ./runtime/initramfs.cpio.gz \
        -net none \
        -enable-kvm \
        -cpu host \
        -smp 1 \
        -append console=ttyS0,panic=1 \
        -device virtio-serial \
        -device virtio-rng-pci \
        -chardev socket,path=virt.sock,server,nowait,id=manager_cdev \
        -device virtserialport,chardev=manager_cdev,name=manager_port \
        -drive file=$DISK,cache=unsafe,readonly=on,format=raw,if=virtio \
        -drive file=pks.img,format=raw,id=disk2 \
        -usb -device usb-host,productid=0xabcd,vendorid=0x1234 \
        -no-reboot

      #  -usb -device usb-host,hostbus=1,hostaddr=37 \