# dotfiles

This repository contains my configuration files and dotfiles.

## Setup Instructions

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/xMohnad/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

1. **Apply Configurations with `stow`**:
   Use the `stow` command to symlink the configuration files to their appropriate locations.

   ```bash
   stow fish 
   # Repeat for other directories as needed
   ```

## Fish Plugins

Managed with **Fisher**

| Plugin    | Source                      |
| --------- | --------------------------- |
| Tide      | IlanCosman/tide@v6          |
| FZF       | jethrokuan/fzf              |
| Bass      | edc/bass                    |
| Bang-Bang | oh-my-fish/plugin-bang-bang |
| Autopair  | jorgebucaran/autopair.fish  |

## Contributing

Feel free to fork this repository, make changes, and submit pull requests.

## License

This project is licensed under the MIT License.
