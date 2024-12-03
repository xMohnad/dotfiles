#!/bin/bash

# set -e # Exit immediately if a command exits with a non-zero status

# Default target directory for testing
TARGET_DIR="~/"

# Log file path
LOG_FILE="$TARGET_DIR/backup_copy_log.txt"

# Function to log messages to a log file
log_message() {
  local message="$1"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
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

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"
log_message "Using target directory: $TARGET_DIR"

# Update and install packages
pkg update && pkg upgrade -y
pkg install tur-repo -y && pkg update
pkg install git wget fish which root-repo x11-repo clang termux-api neovim yarn shfmt lua-language-server python libxml2 libxslt ruff eza bat neofetch fzf -y

# Install and configure Fish shell
if [ ! -e ~/.local/share/omf ]; then
  log_message "Oh My Fish (OMF) not found. Installing..."
  curl -L https://get.oh-my.fish | fish
  if [ -e ~/.local/share/omf ]; then
    log_message "Oh My Fish (OMF) installed successfully."
  else
    log_message "Failed to install Oh My Fish (OMF)."
    exit 1
  fi
else
  log_message "Oh My Fish (OMF) is already installed."
fi

# Change the default shell to Fish if not already set
if [ "$SHELL" != "$(command -v fish)" ]; then
  chsh -s "$(command -v fish)"
  log_message "Fish shell set as default."
else
  log_message "Fish shell is already the default."
fi

# Setup Neovim and additional configurations
yarn global add bash-language-server || log_message "Failed to install bash-language-server"
pip install black mypy pyright || log_message "Failed to install Python packages"
log_message "Neovim and additional packages installed."

# Clone the repository
REPO_URL="https://github.com/xMohnad/termux-dotfiles.git"
INSTALL_DIR="$TARGET_DIR/termux-dotfiles"

if [ -d "$INSTALL_DIR" ]; then
  log_message "Repository already exists at $INSTALL_DIR"
else
  mkdir -p "$INSTALL_DIR"
  git clone "$REPO_URL" "$INSTALL_DIR"
  log_message "Cloned repository from $REPO_URL to $INSTALL_DIR"
fi

log_message "Starting copy operation..."

# Start copy operation
cd "$INSTALL_DIR"
FILES=(".colorscheme" ".fonts" ".gitignore" ".scripts" ".termux")

for file in "${FILES[@]}"; do
  src="./$file"
  dest="$TARGET_DIR/$file"
  if [ -e "$src" ]; then
    backup_and_copy "$src" "$dest"
  else
    log_message "Skipping missing file: $src"
  fi
done

# Copy configuration files
SRC_DIR="./config"
DEST_DIR="$TARGET_DIR/.config"

if [ ! -d "$SRC_DIR" ]; then
  log_message "Source directory $SRC_DIR does not exist."
else
  mkdir -p "$DEST_DIR"
  for file in "$SRC_DIR"/*; do
    base_file=$(basename "$file")
    src="$SRC_DIR/$base_file"
    dest="$DEST_DIR/$base_file"

    if [[ "$base_file" == "fish" ]]; then
      log_message "Skipping directory: $src"
      continue
    fi

    if [ -e "$src" ]; then
      backup_and_copy "$src" "$dest"
    else
      log_message "Skipping missing file/directory: $src"
    fi
  done
fi

# Copy Fish configuration files
FISH_SRC="./config/fish"
FISH_DEST="$TARGET_DIR/.config/fish"

if [ -d "$FISH_SRC" ]; then
  mkdir -p "$FISH_DEST"
  for file in "$FISH_SRC"/*; do
    src="$FISH_SRC/$file"
    dest="$FISH_DEST/$file"
    backup_and_copy "$src" "$dest"
  done
else
  log_message "Fish configuration directory $FISH_SRC does not exist."
fi

# Final setup
touch ~/.hushlogin
termux-reload-settings
if [ -f ~/.config/fish/config.fish ]; then
  source ~/.config/fish/config.fish
fi

# Install and configure Fisher and Tide
log_message "Prompt configured using Tide."
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fish -c "fisher install IlanCosman/tide"
fish -c "tide configure --auto --style=Lean --prompt_colors='True color' --show_time=No"

log_message "Script completed successfully."
