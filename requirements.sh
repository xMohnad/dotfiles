#!/bin/bash

# Color codes
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

# Logging functions
log_message() {
  local message="$1"
  echo -e "${BLUE}INFO${NC} - $message"
}

log_error() {
  local message="$1"
  echo -e "${RED}ERROR${NC} - $message"
}

log_success() {
  local message="$1"
  echo -e "${GREEN}SUCCESS${NC} - $message"
}

log_warning() {
  local message="$1"
  echo -e "${YELLOW}WARNING${NC} - $message"
}

# Function to print section headers
print_section() {
  echo -e "${ORANGE}\n### $1 ${NC}"
}

# Function to print commands
print_command() {
  echo -e "${GREEN}$ ${NC}${GRAY}$1${NC}"
}

# Check for -y flag
AUTO_YES=0
if [[ "$1" == "-y" ]]; then
  AUTO_YES=1
fi

# Function to get user input with validation
get_user_input() {
  local prompt="$1"
  local default_value="$2"
  local valid_inputs=("${@:3}")

  if [[ "$AUTO_YES" -eq 1 ]]; then
    echo "$default_value"
    return 0
  fi

  while true; do
    read -p "$prompt" user_input
    user_input=${user_input:-$default_value} # Use default value if input is empty

    if [[ " ${valid_inputs[*]} " =~ " ${user_input} " ]]; then
      echo "$user_input"
      return 0
    else
      log_error "Invalid input. Please try again."
    fi
  done
}

# Welcome message
log_message "Welcome to the Termux Setup Script!"
log_message "This script will help you set up your Termux environment with Fish shell, Neovim, and more."
if [[ "$AUTO_YES" -eq 1 ]]; then
  log_message "Running in auto-yes mode. All prompts will be automatically accepted."
else
  log_message "Press Enter to accept the default choice (Yes) or type n to skip any step."
fi

sleep 1

# 1. Update & Install Packages
print_section "1. Update & Install Packages"
response=$(get_user_input "Do you want to update and install essential packages? (Y/n) " "Y" "Y" "y" "N" "n")
if [[ "$response" =~ ^([yY])$ ]]; then
  print_command "pkg update && pkg upgrade -y"
  pkg update && pkg upgrade -y

  print_command "apt install git stow wget fish which root-repo x11-repo clang termux-api eza bat neofetch fzf -y"
  apt install git stow wget fish which root-repo x11-repo clang termux-api eza bat neofetch fzf -y
  log_success "Packages updated and installed successfully."
else
  log_warning "Skipping package updates and installations."
fi

sleep 1
# 2. Configure Fish Shell
print_section "2. Configure Fish Shell"
response=$(get_user_input "Do you want to install and configure Fish shell? (Y/n) " "Y" "Y" "y" "N" "n")
if [[ "$response" =~ ^([yY])$ ]]; then
  print_command "curl -L https://get.oh-my.fish | fish"
  # Install Oh My Fish (OMF) if not already installed
  if [ ! -d "$HOME/.local/share/omf" ]; then
    log_message "Installing Oh My Fish (OMF)..."
    curl -L https://get.oh-my.fish | fish &>/dev/null
    if [ $? -eq 0 ]; then
      log_success "Oh My Fish (OMF) installed."
    else
      log_error "Failed to install Oh My Fish (OMF)."
    fi
  else
    log_warning "Oh My Fish (OMF) is already installed."
  fi

  print_command "chsh -s fish"
  # Set Fish as the default shell if not already
  if [ "$SHELL" != "$(command -v fish)" ]; then
    log_message "Setting Fish as the default shell..."
    chsh -s "$(command -v fish)"
    if [ $? -eq 0 ]; then
      log_success "Fish shell set as default."
    else
      log_error "Failed to set Fish shell as default."
    fi
  else
    log_warning "Fish shell is already the default."
  fi
  sleep 1
else
  log_warning "Skipping Fish shell setup."
fi

sleep 1
# 3. Customize Fish Prompt
print_section "3. Customize Fish Prompt"
response=$(get_user_input "Do you want to customize the Fish prompt with Tide? (Y/n) " "Y" "Y" "y" "N" "n")
if [[ "$response" =~ ^([yY])$ ]]; then
  print_command "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
  # Install Fisher if not already installed
  if [ ! -f "$HOME/.config/fish/functions/fisher.fish" ]; then
    log_message "Installing Fisher..."
    fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher" &>/dev/null
    if [ $? -eq 0 ]; then
      log_success "Fisher installed."
    else
      log_error "Failed to install Fisher."
    fi
  else
    log_warning "Fisher is already installed."
  fi

  print_command "fisher install IlanCosman/tide"
  # Install Tide prompt via Fisher if not already installed
  if [ ! -f "$HOME/.config/fish/functions/tide.fish" ]; then
    log_message "Installing Tide prompt..."
    fish -c "fisher install IlanCosman/tide" &>/dev/null
    if [ $? -eq 0 ]; then
      log_success "Tide prompt installed."
    else
      log_error "Failed to install Tide prompt."
    fi
  else
    log_warning "Tide prompt is already installed."
  fi

  print_command "tide configure"
  fish -c "tide configure"
  log_success "Fish prompt customized successfully."
else
  log_warning "Skipping Fish prompt customization."
fi

sleep 1
# 4. Install Fish Plugins
print_section "4. Install Fish Plugins"
response=$(get_user_input "Do you want to install Fish plugins? (Y/n) " "Y" "Y" "y" "N" "n")
if [[ "$response" =~ ^([yY])$ ]]; then
  plugins=(
    "jethrokuan/fzf"
    "jorgebucaran/nvm.fish"
    "edc/bass"
    "oh-my-fish/plugin-ssh"
    "jhillyerd/plugin-git"
    "jorgebucaran/fish-bax"
    "oh-my-fish/plugin-bang-bang"
    "jorgebucaran/autopair.fish"
  )

  total_plugins=${#plugins[@]}
  current_plugin=0

  log_message "Installing Fish plugins..."

  for plugin in "${plugins[@]}"; do
    current_plugin=$((current_plugin + 1))
    echo -e "\nInstalling plugin ${GREEN}$plugin${NC} ($current_plugin/$total_plugins)"
    print_command "fisher install $plugin"
    fish -c "fisher install $plugin" &>/dev/null
  done

  echo -e "\n${GREEN}All plugins installed successfully.${NC}"
else
  log_warning "Skipping Fish plugin installations."
fi

sleep 1
# 5. Set Up Neovim
print_section "5. Set Up Neovim"
response=$(get_user_input "Do you want to set up Neovim with language servers? (Y/n) " "Y" "Y" "y" "N" "n")
if [[ "$response" =~ ^([yY])$ ]]; then
  print_command "apt install neovim -y"
  apt install neovim -y

  # Bash Configuration
  print_section "Bash Configuration"
  print_command "pkg install yarn shfmt -y"
  pkg install yarn shfmt -y

  print_command "yarn global add bash-language-server"
  yarn global add bash-language-server

  # Lua Configuration
  print_section "Lua Configuration"
  print_command "apt install lua-language-server -y"
  apt install lua-language-server -y

  # Python Configuration
  print_section "Python Configuration"
  print_command "apt install python libxml2 libxslt ruff -y"
  apt install python libxml2 libxslt ruff -y

  print_command "pip install black mypy pyright ptpython"
  pip install black pyright ptpython
  log_success "Neovim set up successfully."
else
  log_warning "Skipping Neovim setup."
fi

sleep 1
# Final Message
log_success "Setup complete!."
