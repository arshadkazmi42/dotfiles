#!/bin/bash

# Function to check if a command is available
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Function to install Neovim from a tar.gz archive on Ubuntu
install_neovim_ubuntu() {
	echo "Installing Neovim on Ubuntu..."

	# Download and extract the tar.gz archive
	wget https://github.com/neovim/neovim/releases/download/v0.5.1/nvim-linux64.tar.gz -O /tmp/nvim-linux64.tar.gz
	tar xzf /tmp/nvim-linux64.tar.gz -C /tmp

	# Copy the Neovim binary to /usr/local/bin
	sudo cp /tmp/nvim-linux64/bin/nvim /usr/local/bin

	# Clean up temporary files
	rm /tmp/nvim-linux64.tar.gz
	rm -rf /tmp/nvim-linux64
}

# Function to install and configure tmux
install_tmux() {
	echo "Installing tmux..."
	if command_exists brew; then
		brew install tmux
	elif command_exists apt; then
		sudo apt update
		sudo apt install tmux
	else
		echo "Tmux installation not supported on this system."
		exit 1
	fi

	echo "Installing Tmux Plugin Manager (TPM)..."
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	echo "Copying tmux configuration..."
	curl -o ~/.tmux.conf https://raw.githubusercontent.com/arshadkazmi42/dotfiles/main/tmux.conf

	echo "Install tmux plugins by pressing 'prefix' + 'I' inside tmux session."
	echo "Make sure to run :source-file ~/.tmux.conf from inside tmux session as well."
}

# Function to install Neovim setup
install_nvim_setup() {
	echo "Installing Neovim setup..."
	git clone https://github.com/arshadkazmi42/nvim ~/.config/nvim
}

# Main script

# Check if running on Linux
if [[ $(uname -s) == "Linux" ]]; then
	# Check if running on Ubuntu
	if command_exists lsb_release && lsb_release -d | grep -qi "ubuntu"; then
		install_neovim_ubuntu
	else
		echo "Unsupported Linux distribution. Please install Neovim manually and run this script again."
		exit 1
	fi
else
	echo "Unsupported operating system. Please install Neovim manually and run this script again."
	exit 1
fi

install_tmux
install_nvim_setup

echo "Neovim and tmux setup completed."
