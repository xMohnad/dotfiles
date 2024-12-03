# Interactive Mode Setup

# set -g theme_display_git yes
# set -g theme_display_virtualenv no
# set -g theme_newline_cursor yes


# System and Environment
set -x PATH $PREFIX/bin $HOME/.local/bin $PATH
# set -gx USER "xMohnad"
export TZ='UTC'

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

### EXPORT ###
set fish_greeting # Supresses fish's intro message
set TERM "xterm-256color" # Sets the terminal type
set -Ux EDITOR nvim


### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### SPARK ###
# set -g spark_version 1.0.0

complete -xc spark -n __fish_use_subcommand -a --help -d "Show usage help"
complete -xc spark -n __fish_use_subcommand -a --version -d "$spark_version"
complete -xc spark -n __fish_use_subcommand -a --min -d "Minimum range value"
complete -xc spark -n __fish_use_subcommand -a --max -d "Maximum range value"

source ~/.config/fish/fish_aliases.fish
