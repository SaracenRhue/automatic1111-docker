FROM nvidia/cuda:12.1.0-base-rockylinux9

# Update package repositories and install dependencies
RUN dnf update -y && \
    dnf install -y sudo wget git python3 python3-pip mesa-libGL
# Add a new user
RUN useradd -ms /bin/bash user && \
    echo "user:password" | chpasswd
#  echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER user
WORKDIR /home/user/
RUN mkdir /home/user/stable-diffusion-webui
COPY setup.sh ./

VOLUME /home/user/stable-diffusion-webui/


# Expose port 7860
ENV PORT=7860
EXPOSE 7860

CMD bash setup.sh
