alias preview "fzf --preview='bat --color=always --style=numbers --theme OneHalfDark {}' --preview-window=down"

# Quick Directory Navigation
alias mj='cd /storage/emulated/0/manga-json'
alias sd="cd /sdcard"
alias pf="cd \$PREFIX"

# Acode Editor Directories
alias acode="cd /sdcard/ACode"
alias hik="cd /storage/emulated/0/ACode\ /Hikoky/"
alias red="cd /storage/emulated/0/ACode\ /reader/"
alias nv="nvim"

# Package Management
alias pacupg="pkg upgrade"
alias pacupd="pkg update"
alias upgd="pkg update && pkg upgrade"

# Fonts
alias fontf="cd ~/.local/share/fonts"

# Configuration Files
alias mpdconf="nvim ~/.config/mpd/mpd.conf"
alias mpconf="nvim /data/data/com.termux/files/usr/etc/mpd.conf"
alias ncmconf="nvim ~/.config/ncmpcpp/config"
alias nviminit="nvim ~/.config/nvim/init.lua"
alias fconf="nvim ~/.config/fish/config.fish"
alias fal="nvim ~/.config/fish/fish_aliases.fish"
alias neoconf="nvim ~/.config/neofetch/config.conf"
alias rxconf="nvim ~/.local/bin/rxfetch"
alias reconf="nvim ~/.local/bin/refetch"
alias awesomeconf="nvim ~/.config/awesomeshot/awesomeshot.conf"


# Archives and Media Directories
alias archives="cd /data/data/com.termux/cache/apt/archives/"
alias ss="cd /sdcard/Pictures/Screenshots/"
alias ms="cd /sdcard/Movies"
alias dl="cd /sdcard/Download"
alias ds="cd /sdcard/Documents"

# Color and UI Toys
alias chcolor="~/.scripts/colorscheme/colors.sh"
alias chfont="~/.scripts/fonts/fonts.sh"
alias chzsh="~/.scripts/zsh/changetheme.sh"

# System Information
alias neo "neofetch --ascii_colors 4 6 7"
alias neodebug "bash ~/.config/neofetch/debug-logo.sh (argparse $argv)"
alias disk "bash ~/.scripts/system/fetch.sh storage | column -t"
alias battery "bash ~/.scripts/system/fetch.sh battery"
alias ls "eza --icons --group-directories-first --time-style=long-iso"
alias la "eza --icons -lgha --group-directories-first --time-style=long-iso"
alias lt "eza --icons --tree --time-style=long-iso"
alias lta "eza --icons --tree -lgha --time-style=long-iso"
alias bat "bat --theme OneHalfDark --style=header,numbers"
alias cat "bat --theme OneHalfDark -p (string join ' ' $argv)"

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


# Network Commands
alias pg="ping google.com"  # Ping Google


# emacs
alias em='/usr/bin/emacs -nw'
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

# IP Address Information
alias myip="bash ~/.scripts/system/ip.sh simcard"
alias myipwifi="bash ~/.scripts/system/ip.sh wifi"
alias myiphotspot="~/.scripts/system/ip.sh hotspot"
alias myipvpn="~/.scripts/system/ip.sh vpn"
alias myipall="~/.scripts/system/ip.sh all"

# Color Tests and Toys
alias 256colors2="~/.scripts/toys/256colors2.pl"
alias bloks="~/.scripts/toys/bloks"
alias colortest="~/.scripts/toys/colortest"
alias colortest-slim="~/.scripts/toys/colortest-slim"
alias colorview="~/.scripts/toys/colorview"
alias colorbars="~/.scripts/toys/colorbars"
alias panes="~/.scripts/toys/panes"
alias pipes1="~/.scripts/toys/pipes1"
alias pipes2="~/.scripts/toys/pipes2"
alias pipes2-slim="~/.scripts/toys/pipes2-slim"
alias dna="~/.scripts/toys/dna"
alias ghost="~/.scripts/toys/ghost"
alias jfetch="~/.scripts/toys/jfetch"
alias pacman="~/.scripts/toys/pacman"
alias pipesx="~/.scripts/toys/pipesx"
alias rains="~/.scripts/toys/rains"
alias spacey="~/.scripts/toys/spacey"


# PRoot Distro Management
alias prot="cd \$PREFIX/var/lib/proot-distro"
alias protlogin="proot-distro login \$argv[1]"

# ImageMagick Font List
alias listfont="magick convert -list font | grep -iE 'font:.*'"

# Git Commands
alias gitgraph="git log --all --decorate --oneline --graph"
alias gitupdate="git fetch && git pull"
alias gits="git status"
alias gitad="git add \$argv"
alias gitcom="git commit -m '\$argv'"

alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'


# Web Server Configuration (LAMP)
alias apaconf="nvim \$PREFIX/etc/apache2/httpd.conf"
alias phpmyadminconf="nvim \$PREFIX/etc/phpmyadmin/config.inc.php"

# Terminal and System Settings
alias unsource="exec \$SHELL -l"  # Reload shell
alias reload="termux-reload-settings"  # Reload Termux settings
alias termconf="nvim ~/.termux/termux.properties"
alias termper="termux-setup-storage"  # Grant storage permission

# Script Configuration Files
alias schemeconf="nvim ~/.scripts/colorscheme/colors.sh"
alias fontsconf="nvim ~/.scripts/fonts/fonts.sh"
alias zshthemeconf="nvim ~/.scripts/zsh/changetheme.sh"

# Miscellaneous Aliases
alias q="exit"
alias c="clear; neofetch"  # Clear terminal and fetch system details
alias largefile="du -h -x -s -- * | sort -r -h | head -20"  # Show largest files
alias myipconf="nvim ~/.scripts/ip.sh"
alias loginconf="nvim ~/.scripts/login.sh"
# alias repocek="node ~/.scripts/js/repochecker.js"

# navigation
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


# pacman and yay
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias vifm='./.config/vifm/scripts/vifmrun'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'


# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# bare git repo alias for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# termbin
alias tb="nc termbin.com 9999"

#i the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Unlock LBRY tips
alias tips="lbrynet txo spend --type=support --is_not_my_input --blocking"


# Termux:API
alias scan="termux-media-scan"
alias open="termux-open"

function py
    if test (count $argv) -eq 0
        ptpython
    else
        python $argv
    end
end


function scard
  while true
    set card_number $argv[1]
    curl -s "http://s.net/login?username=$card_number" > /dev/null
    set re (curl -s "http://192.168.133.2/api/change/$card_number?rate=0")
    echo $re | jq -r # '.reply'
    sleep 25
  end
end

neofetch 
