bash
#!/bin/bash
# DEbian fresh install
# Suggested list of Debian packages to install
# version : 0.1
# source: GPT

packages=(
  "i3"
  "git"
  "curl"
  "htop"
  "tmux"
  "build-essential"
  "xorg"
  "network-manager"
  "rofi"
  "pulseaudio"
  "pavucontrol"
)

# Function to add the Emacs secretsauce repository and install Emacs
install_emacs() {
  echo "Adding Emacs secretsauce repository and installing Emacs..."

  # Add the Emacs secretsauce repository to sources.list
  sudo sh -c 'echo "deb [arch=amd64] http://emacs.secretsauce.net unstable main" >> /etc/apt/sources.list'
  sudo sh -c 'echo "deb-src [arch=amd64] http://emacs.secretsauce.net unstable main" >> /etc/apt/sources.list'

  # Add the repository's GPG key to the system
  wget -q -O - http://emacs.secretsauce.net/key.gpg | sudo apt-key add -

  # Update and install Emacs from the secretsauce repository
  sudo apt-get update
  sudo apt-get install -y emacs
}

# Function to install selected packages
install_packages() {
  echo "Available packages to install:"
  for i in "${!packages[@]}"; do
    echo "$((i+1)). ${packages[$i]}"
  done

  echo "Enter the numbers of the packages you want to install, separated by spaces (e.g., 1 3 5):"
  read -r selection

  # Convert the input into an array of selected indexes
  selected_packages=()
  for num in $selection; do
    selected_packages+=("${packages[$((num-1))]}")
  done

  echo "Installing selected packages: ${selected_packages[*]}"
  sudo apt-get update

  # Install the selected packages
  for pkg in "${selected_packages[@]}"; do
    sudo apt-get install -y "$pkg"
  done
}

# Function to clone a Git repository
clone_repo() {
  echo "Enter the Git repository URL to clone:"
  read -r repo_url

  echo "Enter the directory where you want to clone the repository:"
  read -r clone_dir

  if [ -z "$clone_dir" ]; then
    clone_dir=$(basename "$repo_url" .git)
  fi

  echo "Cloning repository from $repo_url to $clone_dir"
  git clone "$repo_url" "$clone_dir"
}

# Main script
echo "Do you want to install packages? (y/n)"
read -r install_choice

if [[ "$install_choice" == "y" ]]; then
  install_packages
fi

echo "Do you want to install Emacs from secretsauce repository? (y/n)"
read -r emacs_choice

if [[ "$emacs_choice" == "y" ]]; then
  install_emacs
fi

echo "Do you want to clone a Git repository? (y/n)"
read -r clone_choice

if [[ "$clone_choice" == "y" ]]; then
  clone_repo
fi

echo "All tasks completed!"

Here’s the fully refactored Bash script that includes the instructions to install Emacs from the http://emacs.secretsauce.net repository, along with installing the other selected packages and cloning a Git repository.
Final Script: install_packages_and_clone.sh

bash

#!/bin/bash

# Suggested list of Debian packages to install
packages=(
  "i3"
  "git"
  "curl"
  "vim"
  "htop"
  "tmux"
  "build-essential"
  "xorg"
  "network-manager"
  "rofi"
  "pulseaudio"
  "pavucontrol"
)

# Function to add the Emacs secretsauce repository and install Emacs
install_emacs() {
  echo "Adding Emacs secretsauce repository and installing Emacs..."

  # Add the Emacs secretsauce repository to sources.list
  sudo sh -c 'echo "deb [arch=amd64] http://emacs.secretsauce.net unstable main" >> /etc/apt/sources.list'
  sudo sh -c 'echo "deb-src [arch=amd64] http://emacs.secretsauce.net unstable main" >> /etc/apt/sources.list'

  # Add the repository's GPG key to the system
  wget -q -O - http://emacs.secretsauce.net/key.gpg | sudo apt-key add -

  # Update and install Emacs from the secretsauce repository
  sudo apt-get update
  sudo apt-get install -y emacs
}

# Function to install selected packages
install_packages() {
  echo "Available packages to install:"
  for i in "${!packages[@]}"; do
    echo "$((i+1)). ${packages[$i]}"
  done

  echo "Enter the numbers of the packages you want to install, separated by spaces (e.g., 1 3 5):"
  read -r selection

  # Convert the input into an array of selected indexes
  selected_packages=()
  for num in $selection; do
    selected_packages+=("${packages[$((num-1))]}")
  done

  echo "Installing selected packages: ${selected_packages[*]}"
  sudo apt-get update

  # Install the selected packages
  for pkg in "${selected_packages[@]}"; do
    sudo apt-get install -y "$pkg"
  done
}

# Function to clone a Git repository
clone_repo() {
  echo "Enter the Git repository URL to clone:"
  read -r repo_url

  echo "Enter the directory where you want to clone the repository:"
  read -r clone_dir

  if [ -z "$clone_dir" ]; then
    clone_dir=$(basename "$repo_url" .git)
  fi

  echo "Cloning repository from $repo_url to $clone_dir"
  git clone "$repo_url" "$clone_dir"
}

# Main script
echo "Do you want to install packages? (y/n)"
read -r install_choice

if [[ "$install_choice" == "y" ]]; then
  install_packages
fi

echo "Do you want to install Emacs from secretsauce repository? (y/n)"
read -r emacs_choice

if [[ "$emacs_choice" == "y" ]]; then
  install_emacs
fi

echo "Do you want to clone a Git repository? (y/n)"
read -r clone_choice

if [[ "$clone_choice" == "y" ]]; then
  clone_repo
fi

echo "All tasks completed!"

# DEbian fresh install

#     Emacs Installation from http://emacs.secretsauce.net:
#         The script adds the repository URL to /etc/apt/sources.list.
#         It adds the GPG key and installs Emacs from this repository.

#     Additional Packages:
#         The script still allows you to select and install other packages like i3, git, and vim.

#     Git Repository Cloning:
#         The script can clone a Git repository if needed.

# How to Use the Script:

# chmod +x install_packages_and_clone.sh

# Run the script:

#     Follow the prompts to:
#         Install selected packages.
#         Install Emacs from the secretsauce repository.
#         Optionally clone a Git repository.

# This script ensures Emacs is installed from your preferred repository while allowing flexibility for additional package installations.
