#!/bin/bash

# Update system
sudo apt update
sudo apt upgrade -y

# Install Git
sudo apt install -y git

# Install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Install necessary dependencies for NVIDIA drivers
sudo apt install -y build-essential dkms linux-headers-$(uname -r)

# Add NVIDIA package repository
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:graphics-drivers/ppa

# Update package list
sudo apt update

# Identify and install the latest recommended NVIDIA driver
nvidia_driver=$(ubuntu-drivers devices | grep -Po '(?<=recommended\s).*(?=\s\()*')
sudo apt install -y $nvidia_driver

# Install Docker
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add the current user to the docker group
sudo usermod -aG docker $USER

# Install NVIDIA Docker utilities
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
  && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
  && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list \
  && sudo apt-get update \
  && sudo apt-get install -y nvidia-docker2 \
  && sudo systemctl restart docker

# Install Python and Poetry
sudo apt install -y python3 python3-pip
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -

# Install kubectl
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install exa
sudo apt install -y exa

# Set up alias for exa
echo "alias exa='exa -lah --git --header'" >> ~/.bashrc

# Install htop
sudo apt install -y htop

# Install Hugging Face Hub
pip3 install huggingface_hub

# Install uv
pip3 install uv

# Create SSH key after reboot
echo "ssh-keygen -t ed25519 -C 'your_email@example.com'" | sudo tee -a /etc/rc.local > /dev/null
sudo chmod +x /etc/rc.local

# Reboot the system
sudo reboot