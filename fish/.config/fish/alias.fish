alias nv="nvim"
alias py="python"
alias pt="ptpython"
alias q="exit"
alias c="clear"
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
alias disk='df -kh . | awk "NR==2 {used=\$3; total=\$2; free=\$4; percent=\$5; printf \"%s / %s = %s (%s)\\n\", used, total, free, percent}"'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Git Commands
alias gits="git status"
