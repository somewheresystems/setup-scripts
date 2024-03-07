# Ubuntu 22.04 Setup Script

This setup script automates the installation and configuration of various tools and utilities on an Ubuntu 22.04 server. It provides a convenient way to set up a development environment with common dependencies and libraries.

## Features

The setup script performs the following tasks:

- Updates the system and installs essential packages
- Installs Git for version control
- Installs oh-my-bash for an enhanced Bash shell experience
- Installs the latest recommended NVIDIA drivers
- Installs Docker and Docker Compose for containerization
- Adds the current user to the Docker group for seamless Docker usage
- Installs NVIDIA Docker utilities for running containers with GPU support
- Installs Python and Poetry for Python package management
- Installs kubectl for managing Kubernetes clusters
- Installs exa, a modern replacement for the ls command, and sets up an alias for exa
- Installs htop for real-time system monitoring
- Installs the Hugging Face Hub library for accessing pre-trained models
- Creates an SSH key after the system reboots

## Prerequisites

Before running the script, ensure that you have:

- A fresh installation of Ubuntu 22.04 server
- Internet connectivity
- Sudo privileges

## Usage

1. Download the `setup.sh` script to your Ubuntu 22.04 server.
2. Open a terminal and navigate to the directory where you saved the `setup.sh` script.
3. Make the script executable by running the following command:

   ```bash
   chmod +x setup.sh
   ```

4. Run the script with sudo privileges:

   ```bash
   sudo ./setup.sh
   ```

The script will execute and install the specified tools and utilities. It may take some time to complete, depending on your internet connection speed.

Once the script finishes, it will automatically reboot the system to apply the changes.

After the reboot, an SSH key will be generated automatically using the email address specified in the script.

## Customization

You can customize the script according to your specific requirements. Feel free to modify the script to include or exclude certain tools and utilities based on your needs.

Before running the script, make sure to review the code and understand what each command does. Replace 'your_email@example.com' with your actual email address when creating the SSH key.

## Notes

- This script is intended for a fresh installation of Ubuntu 22.04 server. Running it on an existing system may have unintended consequences.
- The script installs the latest recommended NVIDIA drivers. If you have specific driver requirements, modify the script accordingly.
- The script sets up an alias for the exa command. You can customize the alias or remove it if not needed.
- The script generates an SSH key after the system reboots. Make sure to replace 'your_email@example.com' with your actual email address.

## Disclaimer

This script is provided as-is without any warranty. Use it at your own risk. Always review and understand the code before executing it on your system.
