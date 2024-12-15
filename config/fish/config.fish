# ===========================
# PATH Configuration
# ===========================
set -x PATH $PREFIX/bin $HOME/.local/bin $PATH
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

# ===========================
# Timezone Configuration
# ===========================
export TZ='UTC'

# ===========================
# Terminal Settings
# ===========================
set TERM "xterm-256color"
set fish_greeting

# ===========================
# Environment Variables
# ===========================
set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x PAGER "less"

# Uncomment if you want to override the USER variable
# set -gx USER "xMohnad"

# ===========================
# Command Completions
# ===========================
#complete -xc spark -n __fish_use_subcommand -a --help -d "Show usage help"
#complete -xc spark -n __fish_use_subcommand -a --version -d "$spark_version"
#complete -xc spark -n __fish_use_subcommand -a --max -d "Maximum range value"

# ===========================
# Source Additional Scripts
# ===========================
source ~/.config/fish/fish_aliases.fish

# ===========================
# Launch Additional Tools
# ===========================
neofetch

