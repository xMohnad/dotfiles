# Add $HOME/.cargo/bin to the PATH environment variable for Rust tools
set PATH $PATH $HOME/.cargo/bin $HOME/Applications $HOME/.local/bin

# Set default options for FZF (Fuzzy Finder)
# - Height: 40% of the terminal window
# - Layout: Reverse (search results appear above the prompt)
# - Border: Adds a border around the FZF window
set -Ux FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"

# Set the timezone to UTC
export TZ='UTC'

# Set the terminal type to xterm-256color for better color support
set TERM "xterm-256color"

# Disable the Fish shell greeting message
set fish_greeting

# Set the DISPLAY environment variable for X11 forwarding
export DISPLAY=:0

# Set the default editor to Neovim
set -x EDITOR "nvim"
set -x VISUAL "nvim"

# Set the default pager to 'less'
set -x PAGER "less"

# Uncomment the following line to override the USER variable
# set -gx USER "xMohnad"

# Source custom alias file if it exists
if test -f ~/.config/fish/alias.fish
    source ~/.config/fish/alias.fish
end

# Source custom script aliases file if it exists
if test -f ~/.config/fish/scripts_alias.fish
    source ~/.config/fish/scripts_alias.fish
end

# Display system information using Neofetch if it is installed
if type neofetch > /dev/null
    # neofetch
end

# Update PATH for Google Cloud SDK if it exists
if [ -f '/data/data/com.termux/files/home/.local/share/google-cloud-sdk/path.fish.inc' ]
    . '/data/data/com.termux/files/home/.local/share/google-cloud-sdk/path.fish.inc'
end

# Additional useful configurations:

# Set default browser (uncomment and modify as needed)
# set -x BROWSER "firefox"

# Set language and locale (uncomment and modify as needed)
# export LANG="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"

# Add a directory to PATH for custom scripts (uncomment and modify as needed)
# set PATH $PATH ~/scripts

# Enable Vi mode in Fish shell (uncomment if you prefer Vi keybindings)
# fish_vi_key_bindings

set -x GOPATH $HOME/.go

function py
    if test (count $argv) -eq 0
        ptpython
    else
        python $argv
    end
end
