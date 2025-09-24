# Environment Paths
set PATH $PATH $HOME/.cargo/bin $HOME/Applications $HOME/.local/bin
set -x GOPATH $HOME/.go

# Set the timezone to UTC
export TZ='UTC'

# Terminal & Editor Settings
set fish_greeting
set TERM xterm-256color
set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less
# set -gx USER "xMohnad"

# Enable Vi mode in Fish shell
fish_vi_key_bindings

# Source custom alias file if it exists
if test -f ~/.config/fish/alias.fish
    source ~/.config/fish/alias.fish
end

# Display system information using Neofetch if it is installed
if type neofetch >/dev/null
    # neofetch
end

# Update PATH for Google Cloud SDK if it exists
if [ -f '/data/data/com.termux/files/home/.local/share/google-cloud-sdk/path.fish.inc' ]
    . '/data/data/com.termux/files/home/.local/share/google-cloud-sdk/path.fish.inc'
end
