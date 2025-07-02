#!/usr/bin/env bash

limactl create --yes ./pwnpad.yml
limactl start pwnpad

ansible-playbook -i inventory.yml resize_disk.yml
limactl restart pwnpad

ansible-playbook -i inventory.yml configure_pwnpad.yml
limactl restart pwnpad
