#!/bin/bash

# Log file path
LOG_FILE="$HOME/backup_copy_log.txt"

# Function to log messages to a log file
log_message() {
  local message="$1"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >>"$LOG_FILE"
}

# Function to copy a file or directory with a backup if it already exists
backup_and_copy() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ]; then
    mv "$dest" "${dest}.bak"
    log_message "Backup created: $dest -> ${dest}.bak"
  fi

  cp -r "$src" "$dest"
  log_message "Copied: $src -> $dest"
}

# Update and install packages
pkg update && pkg upgrade -y
pkg install tur-repo -y
pkg update
pkg install git wget fish which root-repo x11-repo clang termux-api -y

# Install fish and configure prompt
curl -L https://get.oh-my.fish | fish
chsh -s fish
log_message "Fish shell installed and set as default."

# Install prompt using Fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide
tide configure --auto --style=Lean --prompt_colors='True color' --show_time=No --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Many icons' --transient=Yes
log_message "Prompt configured using Tide."

# Setup neovim and additional configurations
pkh install neovim yarn shfmt lua-language-server python libxml2 libxslt ruff -y
yarn global add bash-language-server
pip install black mypy pyright
pkg install eza bat neofetch fzf -y
log_message "Neovim and additional packages installed."

# # # #

# Define the source URL for the repository
REPO_URL="https://github.com/xMohnad/termux-dotfiles.git"
INSTALL_DIR="$HOME/termux-dotfiles"

# Create the destination directory if it doesn't exist
mkdir -p "$INSTALL_DIR"
log_message "Created installation directory: $INSTALL_DIR"

# Clone the repository into the installation directory
git clone "$REPO_URL" "$INSTALL_DIR"
log_message "Cloned repository from $REPO_URL to $INSTALL_DIR"

# Start copy operation
log_message "Starting copy operation..."

cd "$INSTALL_DIR"

# List of files and directories to copy to the home directory
FILES=(
  ".colorscheme"
  ".fonts"
  ".gitignore"
  ".scripts"
  ".termux"
)

# Ensure the destination directory exists
mkdir -p "$DEST_DIR"

# Copy files and directories to the $HOME directory
for file in "${FILES[@]}"; do
  src="./$file"
  dest="$HOME/$file"

  # If source does not exist, create an empty directory/file to copy
  if [ ! -e "$src" ]; then
    mkdir -p "$(dirname "$src")"
    touch "$src"
    log_message "Created empty: $src"
  fi

  backup_and_copy "$src" "$dest"
done

log_message "Copy operation completed successfully."

# Source and destination directories
SRC_DIR="./config"
DEST_DIR="$HOME/.config"

# Copy all files and directories from the source to the destination
for file in "$SRC_DIR"/*; do
  base_file=$(basename "$file")
  src="$SRC_DIR/$base_file"
  dest="$DEST_DIR/$base_file"

  # Skip copying if the directory is 'fish'
  if [[ "$base_file" == "fish" ]]; then
    log_message "Skipping directory: $src"
    continue
  fi

  # If source does not exist, create an empty directory
  if [ ! -e "$src" ]; then
    mkdir -p "$src"
    log_message "Created empty directory: $src"
  fi

  backup_and_copy "$src" "$dest"
done

# Source and destination directories for fish files
FISH_SRC="./config/fish"
FISH_DEST="$HOME/.config/fish"

# Create the destination directory if it does not exist
mkdir -p "$FISH_DEST"

# Copy files from fish source to destination, taking backups
for file in "$FISH_SRC"/*; do
  base_file=$(basename "$file")
  src="$FISH_SRC/$base_file"
  dest="$FISH_DEST/$base_file"

  backup_and_copy "$src" "$dest"
done

log_message "Fish configuration files have been copied successfully."

log_message "finished..."
