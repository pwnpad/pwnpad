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

if [[ ${ARCH} == "aarch64" || ${ARCH} == "arm64" ]]; then
    qemu-img convert -c -o compression_type=zstd -f raw -O qcow2 disk pwnpad-${ARCH}.qcow2
elif [[ ${ARCH} == "x86_64" ]]; then
    qemu-img convert -c -p -O qcow2 diffdisk pwnpad-${ARCH}.qcow2
fi
