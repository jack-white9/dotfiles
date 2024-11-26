#!/usr/bin/env bash

REPO_DIR=$(git rev-parse --show-toplevel)

echo ""
echo "The following prerequisites must be already be installed:"
echo "- zsh"
echo "- oh-my-zsh"
echo "- starship"
echo "- neovim"
echo "- alacritty (macos application)"
read -r -p "Confirm that these have been installed and continue with setup? [y/n] " input

if [[ $input =~ ^[Yy]$ ]]; then
    # Remove existing dotfile configs
    rm "$HOME/.zshrc"
    rm "$HOME/.config/starship.toml"
    rm "$HOME/.config/alacritty/alacritty.toml"
    rm -rf "$HOME/.config/nvim"

    # Create symlinks for dotfile configs
    ln -s "$REPO_DIR/.zshrc" "$HOME/.zshrc"
    ln -s "$REPO_DIR/starship.toml" "$HOME/.config/starship.toml"
    mkdir "$HOME/.config/alacritty" &&  ln -s "$REPO_DIR/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
    ln -s "$REPO_DIR/nvim/" "$HOME/.config/nvim"

    # Confirm success
    echo ""
    echo "Done."
fi
