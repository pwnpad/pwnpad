#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIR="./lima"
VM_NAME="pwnpad-builder"

ANSIBLE_INVENTORY_DIR="./ansible/inventory"
ANSIBLE_PLAYBOOK_DIR="./ansible/playbook"

if ! command -v limactl &> /dev/null
then
    echo "limactl is not installed. Please install lima-vm."
    exit 1
fi

if ! command -v ansible-playbook &> /dev/null
then
    echo "ansible-playbook is not installed. Please install ansible."
    exit 1
fi

if [ ! -d "${LIMA_HOME:-${HOME}/.lima}/${VM_NAME}" ]
then
    limactl create --yes ${CONFIG_DIR}/${VM_NAME}.yml
fi

# Slow boots can exceed lima's fixed limits
if ! limactl start --timeout "${LIMA_START_TIMEOUT:-10m}" ${VM_NAME}
then
    echo "limactl start reported a problem. Waiting for the VM to finish booting."
    SSH_CONFIG="${LIMA_HOME:-${HOME}/.lima}/${VM_NAME}/ssh.config"
    READY=0
    for _ in $(seq 60)
    do
        if [ "$(limactl list --format '{{.Status}}' ${VM_NAME})" != "Running" ]
        then
            break
        fi

        if ssh -F "${SSH_CONFIG}" -o ConnectTimeout=20 lima-${VM_NAME} test -e /run/lima-boot-done < /dev/null
        then
            READY=1
            break
        fi
        sleep 10
    done

    if [ "${READY}" -ne 1 ]
    then
        echo "The VM did not finish booting."
        exit 1
    fi
fi

ansible-playbook -v -i ${ANSIBLE_INVENTORY_DIR}/inventory.yml ${ANSIBLE_PLAYBOOK_DIR}/configure_pwnpad.yml
ansible-playbook -v -i ${ANSIBLE_INVENTORY_DIR}/inventory.yml ${ANSIBLE_PLAYBOOK_DIR}/install_gui.yml
ansible-playbook -v -i ${ANSIBLE_INVENTORY_DIR}/inventory.yml ${ANSIBLE_PLAYBOOK_DIR}/cleanup_space.yml
# In case stop kills the VM
limactl shell --workdir / ${VM_NAME} sync
limactl stop ${VM_NAME}

# Host keys regenerate on next boot
rm -f "${LIMA_HOME:-${HOME}/.lima}/${VM_NAME}/ssh.known_hosts"
