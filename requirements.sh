pkg update && pkg upgrade -y
pkg install tur-repo -y
pkg update

pkg install git wget fish which root-repo x11-repo clang termux-api -y

# fish
curl -L https://get.oh-my.fish | fish
chsh -s fish

# prompt
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide
tide configure --auto --style=Lean --prompt_colors='True color' --show_time=No --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Many icons' --transient=Yes

# setup nvim
pkh install neovim -y

## bash conf nvim
pkg install yarn shfmt -y
yarn global add bash-language-server

## lua conf nvim
pkg install lua-language-server -y

## python conf nvim
pkg install python libxml2 libxslt ruff -y
pip install black mypy pyright ptpython

pkg install eza bat neofetch fzf -y
