#!/bin/bash

dir="/home/user/stable-diffusion-webui"
# check if the directory is empty
if [ ! -d "$dir" ]; then
    echo "Directory is empty"
    cd "$dir"
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git .
    echo 'export COMMANDLINE_ARGS="--listen"' >> ./webui-user.sh
    wget -P models/Stable-diffusion https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt
else
    echo "Directory is not empty"
    cd "$dir"
fi

bash webui.sh