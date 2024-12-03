#!/bin/bash

# Set up paths
# TARGET_DIR="./test/"
TARGET_DIR="$HOME"

LOG_FILE="$TARGET_DIR/installation_log.txt"
INSTALL_DIR="$TARGET_DIR/termux-dotfiles"

# Directories to copy files to
SCRIPTS="$TARGET_DIR/.scripts"
FONTS="$TARGET_DIR/.fonts"
TERMUX_CONFIG="$TARGET_DIR/.termux"
COLORSCHEME="$TARGET_DIR/.colorscheme"

CONFIG_DIR="$TARGET_DIR/.config"
NEOVIM_CONFIG="$CONFIG_DIR/nvim"
MYTERMUX_CONFIG="$CONFIG_DIR/mytermux"

FISH_CONFIG="$CONFIG_DIR/fish"
FISH_CONFIG_FILE="$FISH_CONFIG/config.fish"
FISH_ALIASES_FILE="$FISH_CONFIG/fish_aliases.fish"

# Log function to log messages
log_message() {
  local message="$1"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
}

# Backup and copy function for files and directories
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
# Install required packages
install_packages() {
  log_message "Updating and upgrading system packages..."
  pkg update && pkg upgrade -y
  log_message "Installing necessary packages..."
  pkg install git wget fish neovim curl termux-api x11-repo clang -y
}

# Install and configure Fish shell
configure_fish() {
  log_message "Configuring Fish shell..."

  if [ ! -d "$HOME/.local/share/omf" ]; then
    log_message "Installing Oh My Fish (OMF)..."
    curl -L https://get.oh-my.fish | fish
    log_message "Oh My Fish (OMF) installed."
  else
    log_message "Oh My Fish (OMF) is already installed."
  fi

  if [ "$SHELL" != "$(command -v fish)" ]; then
    chsh -s "$(command -v fish)"
    log_message "Fish shell set as default."
  else
    log_message "Fish shell is already the default."
  fi

  # Install and configure Tide prompt via Fisher
  log_message "Prompt configured using Tide."

  # Ask user if they want to change the prompt to Tide
  read -p "Do you want to change the prompt to Tide? (y/n): " change_prompt

  if [[ "$change_prompt" =~ ^[Yy]$ ]]; then
    log_message "Prompt configured using Tide."

    if [ ! -f "$HOME/.config/fish/functions/fisher.fish" ]; then
      fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
    fi

    if [ ! -f "$HOME/.config/fish/functions/tide.fish" ]; then
      fish -c "fisher install IlanCosman/tide"
    fi

    fish -c "tide configure --auto --style=Lean --prompt_colors='True color' --show_time=No"
    log_message "Tide prompt configured."
  else
    log_message "Keeping the default prompt."
  fi
}

# Install Neovim and additional configurations
configure_neovim() {
  log_message "Setting up Neovim..."
  yarn global add bash-language-server || log_message "Failed to install bash-language-server"
  pip install black mypy pyright || log_message "Failed to install Python packages"
  log_message "Neovim and additional packages installed."
}

# Clone the repository if it doesn't exist
clone_repository() {
  if [ ! -d "$INSTALL_DIR" ]; then
    git clone "https://github.com/xMohnad/termux-dotfiles.git" "$INSTALL_DIR"
    log_message "Cloned repository into $INSTALL_DIR."
  else
    log_message "Repository already exists at $INSTALL_DIR."
  fi
}

# Copy configuration files from source to destination
copy_config_files() {
  log_message "Copying configuration files..."

  # Start copying files

  # Copy .colorscheme files
  log_message "Starting to copy .colorscheme"
  backup_and_copy "$INSTALL_DIR/.colorscheme" "$COLORSCHEME"

  # Copy .fonts files
  log_message "Starting to copy .fonts"
  backup_and_copy "$INSTALL_DIR/.fonts" "$FONTS"

  # Copy .scripts files
  log_message "Starting to copy .scripts"
  backup_and_copy "$INSTALL_DIR/.scripts" "$SCRIPTS"

  # Copy .termux files
  log_message "Starting to copy .termux"
  backup_and_copy "$INSTALL_DIR/.termux" "$TERMUX_CONFIG"

  # Copy fish config files
  log_message "Starting to copy fish config"
  # Ensure the target directories exist
  mkdir -p "$TARGET_DIR/.config/fish"
  mkdir -p "$TARGET_DIR/.config/nvim"
  mkdir -p "$TARGET_DIR/.config/mytermux"
  backup_and_copy "$INSTALL_DIR/config/fish/config.fish" "$FISH_CONFIG_FILE"
  backup_and_copy "$INSTALL_DIR/config/fish/fish_aliases.fish" "$FISH_ALIASES_FILE"

  # Copy neovim config
  log_message "Starting to copy Neovim config"
  backup_and_copy "$INSTALL_DIR/config/nvim" "$NEOVIM_CONFIG"

  # Copy mytermux config
  log_message "Starting to copy mytermux config"
  backup_and_copy "$INSTALL_DIR/config/mytermux" "$MYTERMUX_CONFIG"

}

# Final setup
final_setup() {
  log_message "Performing final setup..."
  touch "$TARGET_DIR/.hushlogin"
  termux-reload-settings
  # if [ -f "$HOME/.config/fish/config.fish" ]; then
  # source "$HOME/.config/fish/config.fish"
  # fi
}

# Run all installation steps
main() {
  log_message "Starting installation process..."

  # Install packages
  install_packages

  # Configure Fish
  configure_fish

  # Configure Neovim
  configure_neovim

  # Clone repository and copy files
  clone_repository
  copy_config_files

  # Final setup
  final_setup

  log_message "Installation completed successfully."
}

# Execute the main function
main
