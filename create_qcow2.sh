#!/usr/bin/env bash

set -euo pipefail

VM_NAME="pwnpad-builder"
ARCH="$(uname -m)"

# Match macOS naming
if [ "${ARCH}" = "aarch64" ]
then
    ARCH="arm64"
fi

if [ -z "${LIMA_HOME:-}" ]
then
    LIMA_HOME=~/.lima
fi

if ! command -v qemu-img &> /dev/null
then
    echo "qemu-img is not installed. Please install qemu."
    exit 1
fi

cd "${LIMA_HOME}/${VM_NAME}"

# No -f: raw on vz, qcow2 on qemu
qemu-img convert -c -o compression_type=zstd -W -m 16 -O qcow2 disk "pwnpad-${ARCH}.qcow2"
