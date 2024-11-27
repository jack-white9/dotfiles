# dotfiles

This repository contains the dotfiles that I use for macOS development.

The following tools, apps, and configs are installed:

- Alacritty
- Homebrew
- Rust
- oh-my-zsh
- Starship
- neovim
- lazygit

## Installation

To install, run the following command from the repository root:

```shell
./install.sh
```

## Self-Signing Alacritty

When using Alacritty on macOS, the app must be self-signed to avoid the `"Alacritty can't be opened because it is from an unidentified developer"` error. To do this, follow these instructions: https://github.com/alacritty/alacritty/wiki/Self-Signing-Alacritty-on-macOS

