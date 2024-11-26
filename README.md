# dotfiles

This repository contains the dotfiles that I use for macOS development, including vim (neovim + nvchad), starship, and zsh (oh-my-zsh).

## Prerequisites

- [Homebrew](https://brew.sh/)
- [oh-my-zsh](https://ohmyz.sh/#install)
- [Starship](https://starship.rs/installing/)

## Installation

To install, run the following command from the repository root:

```shell
chmod +x ./bootstrap.sh
./bootstrap.sh
```

## Self-Signing Alacritty

When using Alacritty, the app must be self-signed to avoid the `"Alacritty can't be opened because it is from an unidentified developer"` error. To do this, follow these instructions: https://github.com/alacritty/alacritty/wiki/Self-Signing-Alacritty-on-macOS
