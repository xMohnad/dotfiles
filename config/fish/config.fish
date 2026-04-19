# Nothing to do if not inside an interactive shell.
if not status is-interactive
    return 0
end

# Remove the gretting message.
set -U fish_greeting

# Vi mode.
set -g fish_key_bindings fish_vi_key_bindings
set fish_vi_force_cursor 1
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

# Shell integrations.
fzf --fish | source

# Color theme.
fish_config theme choose "TokyoNight Night"

# Source custom alias file if it exists
if test -f ~/.config/fish/alias.fish
    source ~/.config/fish/alias.fish
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/data/data/com.termux/files/home/Applications/google-cloud-sdk/path.fish.inc' ]
    . '/data/data/com.termux/files/home/Applications/google-cloud-sdk/path.fish.inc'
end
