#!/usr/bin/env bash

VM_NAME="pwnpad-builder"
ARCH="$(uname -m)"

if [ -z "${LIMA_HOME}" ]
then
    LIMA_HOME=~/.lima
fi

if ! command -v qemu-img &> /dev/null
then
    echo "qemu-img is not installed. Please install qemu."
    exit 1
fi

cd ${LIMA_HOME}/${VM_NAME}

qemu-img convert -c -o compression_type=zstd -W -m 16 -f raw -O qcow2 disk pwnpad-${ARCH}.qcow2
