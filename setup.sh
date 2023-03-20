#!/bin/bash

rm -rf setup.sh
if [ ! -e webui.sh ]; then
    echo "Directory is empty"
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git .
    echo 'export COMMANDLINE_ARGS="--listen --enable-insecure-extension-access"' >> ./webui-user.sh
    wget -P models/Stable-diffusion https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt
else
    echo "Directory is not empty"
fi

bash webui.sh
