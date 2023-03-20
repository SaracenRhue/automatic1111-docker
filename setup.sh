#!/bin/bash

cd /home/user/stable-diffusion-webui

# check if the directory is empty
if [ ! -e webui.sh ]; then
    echo "Directory is empty"
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git .
    echo 'export COMMANDLINE_ARGS="--listen --enable-insecure-extension-access"' >> ./webui-user.sh
    wget -P models/Stable-diffusion https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.ckpt
else
    echo "Directory is not empty"
fi

bash webui.sh
