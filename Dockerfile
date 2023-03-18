FROM nvidia/cuda:12.1.0-base-rockylinux9

# Update package repositories and install dependencies
RUN dnf update -y

RUN dnf install -y wget git python3 python3-pip
# Add a new user
RUN useradd -ms /bin/bash user && \
    echo "user:password" | chpasswd

USER user
WORKDIR /home/user
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
WORKDIR /home/user/stable-diffusion-webui
RUN echo 'export COMMANDLINE_ARGS="--listen"' >> ./webui-user.sh

# VOLUME /home/user/stable-diffusion-webui/models/Stable-diffusion
# VOLUME /home/user/stable-diffusion-webui/extensions
# VOLUME /home/user/stable-diffusion-webui/embeddings


# Expose port 7860
ENV PORT=7860
EXPOSE 7860

CMD bash webui.sh
