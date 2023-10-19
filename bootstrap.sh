#!/usr/bin/env bash

REPO_DIR=$(git rev-parse --show-toplevel)

echo ""
echo "The following prerequisites must be already be installed:"
echo "- zsh"
echo "- oh-my-zsh"
echo "- starship"
echo "- neovim"
read -r -p "Confirm that these have been installed and continue with setup? [y/n] " input

if [[ $input =~ ^[Yy]$ ]]; then
    ln -s "$REPO_DIR/.zshrc" "$HOME/.zshrc"
    ln -s "$REPO_DIR/starship.toml" "$HOME/.config/starship.toml"
    ln -s "$REPO_DIR/nvim/" "$HOME/.config/nvim"
    echo ""
    echo "Done."
fi
