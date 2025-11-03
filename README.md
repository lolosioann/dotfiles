# dotfiles

My personal configuration files for Arch Linux + Hyprland, themed with Catppuccin.

## Overview

This repository contains configurations for:

- **Shell**: zsh
- **Terminal**: kitty
- **Editor**: nvim
- **File Manager**: yazi
- **App Launcher**: wofi
- **Status Bar**: waybar
- **Notifications**: dunst
- **System Monitor**: btop
- **CLI Tools**: bat, eza, fastfetch
  and more...

## Installation

> [!NOTE]
> TODO: Make an installation script

For now, manually symlink the configuration files to their appropriate locations:

```bash
# Example
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/kitty ~/.config/kitty
# ... repeat for other configs
```

Or copy the files to the .config folder

> [!CAUTION]
> This will overwrite existing configuration files!

```bash
cp -r ~/dotfiles/* ~/.config/
```

## Dependencies

Ensure you have the following packages installed:

```bash
sudo pacman -S bat btop dunst eza fastfetch kitty neovim waybar wofi yazi zsh
```

Additional dependencies may be required for specific configurations (e.g., Hyprland, fonts, theme packages).

## Theme

All configurations use the [Catppuccin](https://github.com/catppuccin/catppuccin) color scheme for a consistent look across applications.

## License

Feel free to use and modify these configurations as you see fit.
