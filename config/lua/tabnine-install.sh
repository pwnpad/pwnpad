#!/bin/bash

COQ_PATH="$HOME/.local/share/nvim/site/pack/packer/start/coq_nvim/.vars/"
TABNINE_VERSION=$(curl -fsSL https://update.tabnine.com/bundles/version)

mkdir -p $COQ_PATH/$TABNINE_VERSION/t9
mkdir -p $COQ_PATH/clients/t9

curl -sS https://update.tabnine.com/bundles/$TABNINE_VERSION/x86_64-unknown-linux-musl/TabNine.zip > TabNine.zip
unzip -d $COQ_PATH/$TABNINE_VERSION/t9 TabNine.zip
chmod +x $COQ_PATH/$TABNINE_VERSION/t9/*
cp $COQ_PATH/$TABNINE_VERSION/t9/TabNine $COQ_PATH/clients/t9/

rm TabNine.zip
