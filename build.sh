#!/usr/bin/env bash

CONFIG_DIR="./config"
ANSIBLE_INVENTORY_DIR="./ansible/inventory"
ANSIBLE_PLAYBOOK_DIR="./ansible/playbook"

limactl create --yes $CONFIG_DIR/pwnpad.yaml
limactl start pwnpad

ansible-playbook -i $ANSIBLE_INVENTORY_DIR/inventory.yml $ANSIBLE_PLAYBOOK_DIR/resize_disk.yml
limactl restart pwnpad

ansible-playbook -i $ANSIBLE_INVENTORY_DIR/inventory.yml $ANSIBLE_PLAYBOOK_DIR/configure_pwnpad.yml
ansible-playbook -i $ANSIBLE_INVENTORY_DIR/inventory.yml $ANSIBLE_PLAYBOOK_DIR/install_gui.yml
limactl restart pwnpad
