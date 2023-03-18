FROM nvidia/cuda:12.1.0-base-ubuntu22.04

# Update package repositories and install dependencies
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata. 
RUN apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl git llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev

# Add a new user
RUN useradd -ms /bin/bash user && \
    echo "user:password" | chpasswd

# Install Pyenv
RUN curl https://pyenv.run | bash
# Add Pyenv to the shell environment
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
# Install Python 3.10 using Pyenv
RUN pyenv install 3.10 && \
    pyenv global 3.10

WORKDIR /home/user
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
WORKDIR /home/user/stable-diffusion-webui
RUN pip install -r requirements.txt

# Expose port 7860
ENV PORT=7860
EXPOSE 7860

CMD python launch.py
