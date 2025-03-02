alias nv="nvim"
alias preview="fzf --preview='bat --color=always --style=numbers --theme OneHalfDark {}' --preview-window=down"
alias q="exit"
alias c="clear; neofetch"  # Clear terminal and fetch system details
alias pg="ping google.com"  # Ping Google
alias largefile="du -h -x -s -- * | sort -r -h | head -20"  # Show largest Files

# Quick Directory Navigation
alias sd="cd /sdcard"
alias archives="cd /data/data/com.termux/cache/apt/archives/"
alias ms="cd /sdcard/Movies"
alias dl="cd /sdcard/Download"
alias ds="cd /sdcard/Documents"

alias fontf="cd ~/.local/share/fonts"
alias mj='cd /storage/emulated/0/manga-json'
alias pf="cd \$PREFIX"
alias b="cd -"

# projects Directories
alias proj="cd ~/projects/"
alias cdweb='cd ~/Projects/Web'
alias cdcli='cd ~/Projects/CLI'
alias cdpythoncli='cd ~/Projects/CLI/Python'
alias cdbashcli='cd ~/Projects/CLI/Bash'
alias cddesktop='cd ~/Projects/Desktop'
alias cdlibraries='cd ~/Projects/Libraries'
alias cdmobile='cd ~/Projects/Mobile'
alias cdexperiments='cd ~/Projects/Experiments'
alias cdarchives='cd ~/Projects/Archives'

# silicon
alias silicon-font="silicon --font 'DejaVu Sans Mono'"

# Package Management
alias pacupg="pkg upgrade"
alias pacupd="pkg update"
alias upgd="pkg update && pkg upgrade"

# Configuration Files
alias nviminit="nvim ~/.config/nvim/init.lua"
alias fconf="nvim ~/.config/fish/config.fish"
alias fal="nvim ~/.config/fish/alias.fish"
alias neoconf="nvim ~/.config/neofetch/config.conf"
alias termconf="nvim ~/.termux/termux.properties"
alias myipconf="nvim ~/.scripts/ip.sh"
alias loginconf="nvim ~/.scripts/login.sh"
alias prot="cd \$PREFIX/var/lib/proot-distro"

# System Information
alias disk="bash ~/.scripts/system/fetch.sh storage | column -t"
alias battery="bash ~/.scripts/system/fetch.sh battery"
alias ls="eza --icons --group-directories-first --time-style=long-iso"
alias la="eza --icons -lgha --group-directories-first --time-style=long-iso"
alias lt="eza --icons --tree --group-directories-first --time-style=long-iso"
alias lta="eza --icons --tree -lgha --group-directories-first --time-style=long-iso"
alias bat="bat --theme OneHalfDark --style=header,numbers"
alias cat="bat --theme OneHalfDark -p (string join ' ' $argv)"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-opus-best="yt-dlp -f 'bestaudio[ext=opus]' "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "
alias ytv-medium="yt-dlp -f 'bestvideo[height<=480]+bestaudio' "
alias ytv-high="yt-dlp -f 'bestvideo[height<=720]+bestaudio' "
alias ytv-low="yt-dlp -f 'bestvideo[height<=360]+bestaudio' "

# Git Commands
alias gitgraph="git log --all --decorate --oneline --graph"
alias gitupdate="git fetch && git pull"
alias gits="git status"
alias gitad="git add \$argv"
alias gitcom="git commit -m '\$argv'"

# Terminal and System Settings
alias unsource="exec \$SHELL -l"  # Reload shell
alias reload="termux-reload-settings"  # Reload Termux settings
alias termper="termux-setup-storage"  # Grant storage permission

# navigation
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# confirm before overwriting something
alias mv='mv -i'
alias rm='rm -i'

# Termux:API
alias scan="termux-media-scan"
alias open="termux-open"

# termbin
alias tb="nc termbin.com 9999"

#i the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# PRoot Distro Management
alias protlogin="proot-distro login \$argv[1]"

# ImageMagick Font List
alias listfont="magick convert -list font | grep -iE 'font:.*'"

function py
    if test (count $argv) -eq 0
        ptpython
    else
        python $argv
    end
end
