#!/bin/bash

# Set up paths
TARGET_DIR="$HOME"
LOG_FILE="$TARGET_DIR/installation_log.txt"
INSTALL_DIR="$TARGET_DIR/termux-dotfiles"

# Log function to log messages
log_message() {
  local message="$1"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
}

# Backup and copy function for files and directories
backup_and_copy() {
  local src="$1"
  local dest="$2"

  if [ ! -e "$src" ]; then
    log_message "Source does not exist: $src"
    return 1
  fi

  if [ -e "$dest" ]; then
    mv "$dest" "${dest}.bak"
    log_message "Backup created: $dest -> ${dest}.bak"
  fi

  mkdir -p "$(dirname "$dest")"
  rsync -av "$src" "$dest"
  if [ $? -eq 0 ]; then
    log_message "Copied: $src -> $dest"
    sleep 0.2
  else
    log_message "Failed to copy: $src -> $dest"
    return 1
  fi
}

# List of files and directories to copy
declare -A COPY_LIST=(
  ["$INSTALL_DIR/.colorscheme"]="$TARGET_DIR/.colorscheme"
  ["$INSTALL_DIR/.fonts"]="$TARGET_DIR/.fonts"
  ["$INSTALL_DIR/.scripts"]="$TARGET_DIR/.scripts"
  ["$INSTALL_DIR/.termux"]="$TARGET_DIR/.termux"
  ["$INSTALL_DIR/config/fish/config.fish"]="$TARGET_DIR/.config/fish/config.fish"
  ["$INSTALL_DIR/config/fish/fish_aliases.fish"]="$TARGET_DIR/.config/fish/fish_aliases.fish"
  ["$INSTALL_DIR/config/fish/completions/pkg.fish"]="$TARGET_DIR/.config/fish/completions/pkg.fish"
  ["$INSTALL_DIR/config/nvim"]="$TARGET_DIR/.config/nvim"
  ["$INSTALL_DIR/config/mytermux"]="$TARGET_DIR/.config/mytermux"
  ["$INSTALL_DIR/config/ptpython"]="$TARGET_DIR/.config/ptpython"
)

# Copy configuration files from source to destination
copy_config_files() {
  log_message "Copying configuration files..."

  for src in "${!COPY_LIST[@]}"; do
    dest="${COPY_LIST[$src]}"
    backup_and_copy "$src" "$dest"
  done
}

# Install required packages
install_packages() {
  log_message "Updating and upgrading system packages..."
  pkg update && pkg upgrade -y
  log_message "Installing necessary packages..."
  pkg install git wget fish rsync curl termux-api x11-repo eza bat fzf -y
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
  log_message "Checking Neovim installation..."

  # Ask the user if they want to install Neovim
  read -p "Do you want to install and configure Neovim? (Y/n): " install_neovim
  install_neovim=${install_neovim:-Y}

  if [[ "$install_neovim" =~ ^[Yy]$ ]]; then

    if ! command -v neovim &>/dev/null; then
      log_message "Installing Neovim..."
      pkg install neovim -y || log_message "Failed to install Neovim."
    fi

    log_message "Installing additional dependencies for Neovim..."

    # Install yarn if not already installed
    if ! command -v yarn &>/dev/null; then
      log_message "Installing yarn..."
      pkg install yarn -y || log_message "Failed to install yarn."
    fi

    # Install language servers and formatters using yarn
    log_message "Installing language servers and formatters..."
    yarn global add bash-language-server prettier yaml-language-server || log_message "Failed to install language servers."

    ## bash conf nvim
    pkg install shfmt -y

    ## lua conf nvim
    pkg install lua-language-server -y

    # Install Python and related packages
    log_message "Installing Python and related packages..."
    pkg install python -y || log_message "Failed to install Python."
    pip install black pyright ptpython mdformat || log_message "Failed to install Python packages."

    log_message "Neovim and additional packages installed successfully."
  else
    log_message "Skipping Neovim installation and configuration."
  fi
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

# Final setup
final_setup() {
  log_message "Performing final setup..."
  touch "$TARGET_DIR/.hushlogin"
  termux-reload-settings
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
