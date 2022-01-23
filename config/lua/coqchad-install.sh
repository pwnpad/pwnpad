#!/bin/bash
COQ_PATH="$HOME/.local/share/nvim/site/pack/packer/start/coq_nvim"
CHAD_PATH="$HOME/.local/share/nvim/site/pack/packer/opt/chadtree"

cd $COQ_PATH && python3 -m coq deps
cd $CHAD_PATH && python3 -m chadtree deps --nvim
