#!/usr/bin/env bash

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

limactl create --yes ${CONFIG_DIR}/${VM_NAME}.yml
limactl start ${VM_NAME}

ansible-playbook -i ${ANSIBLE_INVENTORY_DIR}/inventory.yml ${ANSIBLE_PLAYBOOK_DIR}/configure_pwnpad.yml
ansible-playbook -i ${ANSIBLE_INVENTORY_DIR}/inventory.yml ${ANSIBLE_PLAYBOOK_DIR}/install_gui.yml
limactl stop ${VM_NAME}
