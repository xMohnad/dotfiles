alias nv="nvim"
alias py="bpython"
alias q="exit"
alias c="clear"
alias cn="clear; neofetch"
alias pg="ping google.com"
alias b="cd -"

# confirm before overwriting something
alias mv='mv -i'
alias rm='rm -i'

# System Information
alias ls="eza --icons --group-directories-first --time-style=long-iso"
alias la="eza --icons -lgha --group-directories-first --time-style=long-iso"
alias lt="eza --icons --tree --group-directories-first --time-style=long-iso"
alias lta="eza --icons --tree -lgha --group-directories-first --time-style=long-iso"
alias bat="bat --theme OneHalfDark --style=header,numbers"
alias cat="bat --theme OneHalfDark -p (string join ' ' $argv)"
alias cat="bat --theme OneHalfDark -p (string join ' ' $argv)"
alias disk='df -kh . | awk "NR==2 {used=\$3; total=\$2; free=\$4; percent=\$5; printf \"%s / %s = %s (%s)\\n\", used, total, free, percent}"'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Git Commands
alias gitgraph="git log --all --decorate --oneline --graph"
alias gitupdate="git fetch && git pull"
alias gits="git status"

# Terminal and System Settings
alias unsource="exec \$SHELL -l" # Reload shell

# navigation
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# termbin
alias tb="nc termbin.com 9999"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# silicon
alias silicon-font="silicon --font 'DejaVu Sans Mono'"
