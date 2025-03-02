# termux-dotfiles

This repository contains my personal configuration files and dotfiles for Termux. It includes configurations for various tools and utilities used in my Termux environment. These files are intended to provide a consistent setup across different devices and installations.

## Setup Instructions

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/xMohnad/termux-dotfiles.git
   cd termux-dotfiles
   ```

1. **Run the Install Script**:
   Execute the `requirements.sh` script to install all necessary tools.

   ```bash
   ./requirements.sh
   ```

1. **Apply Configurations with `stow`**:
   Use the `stow` command to symlink the configuration files to their appropriate locations.

   ```bash
   stow fish
   stow nvim
   stow neofetch
   # Repeat for other directories as needed
   ```

1. **Verify the Setup**:
   Check that the configurations are applied correctly by opening the respective tools (e.g., `fish`, `nvim`, etc.).

## Key Files

### `requirements.sh`

- **Purpose**: This script automates the installation of essential tools and utilities required for the setup.
- **Usage**: Run the script to install all dependencies.
  ```bash
  ./requirements.sh
  ```
  *or*
  ```bash
  ./requirements.sh -y
  ```

### `stow`

- **Purpose**: The `stow` command is used to symlink configuration files from the project directory to their respective locations in the system.
- **Usage**: Use `stow` to apply the configurations.
  ```bash
  stow <directory_name>
  ```
  *Example:*
  ```bash
  stow nvim
  ```

## Notes

- The `requirements.sh` script only installs the tools. The actual configurations are applied using `stow`.
- Ensure `stow` is installed on your system before running the setup. If not, install it using:
  ```bash
  pkg install stow
  ```

## Customization

You can modify the configuration files to suit your preferences. For example, you can change the appearance of the Fish shell prompt or add new plugins to Neovim. The files are modular, so you can easily adapt them to your own workflow.

## Contributing

Feel free to fork this repository, make changes, and submit pull requests.

## License

This project is licensed under the MIT License.
