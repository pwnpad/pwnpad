#!/usr/bin/env bash

VM_NAME="pwnpad-builder"

if [ -z "${LIMA_HOME}" ]
then
    LIMA_HOME=~/.lima
fi

if ! command -v qemu-img &> /dev/null
then
    echo "qemu-img is not installed. Please install qemu."
    exit 1
fi

if ! command -v virt-sparsify &> /dev/null
then
    echo "virt-sparsify is not installed. Please install libguestfs."
    exit 1
fi

cd ${LIMA_HOME}/${VM_NAME}
qemu-img convert -f raw -O qcow2 -o backing_file=basedisk,backing_fmt=qcow2 \
    diffdisk diffdisk-linked.qcow2
qemu-img convert -p -O qcow2 diffdisk-linked.qcow2 pwnpad.qcow2

rm diffdisk-linked.qcow2

virt-sparsify --compress pwnpad.qcow2 pwnpad-new.qcow2
mv pwnpad-new.qcow2 pwnpad.qcow2

# Split the image into two parts for github release
# split -b 2000M -d -a 2 pwnpad.qcow2 pwnpad.qcow2.part_
