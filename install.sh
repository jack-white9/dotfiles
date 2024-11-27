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
  # Remove existing dotfile configs (clean slate)
  rm -f "$HOME/.zshrc"
  rm -f "$HOME/.config/starship.toml"
  rm -rf "$HOME/.config/alacritty"
  rm -rf "$HOME/.config/nvim"
  rm -rf "$HOME/Library/Application Support/lazygit"

  # Install Homebrew
  TEMP_DIR=$(mktemp -d)
  HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
  echo "Installing Homebrew..."
  curl -fsSL "$HOMEBREW_URL" -o "$TEMP_DIR/install.sh"
  /bin/bash "$TEMP_DIR/install.sh"
  rm -rf "$TEMP_DIR"
  echo "Homebrew installed."

  # Install Homebrew apps
  echo "Installing Homebrew apps..."
  brew install awscli helm kubectx k8sec lazygit ripgrep tfenv tflint terraform-docs tree-sitter
  echo "Homebrew apps installed."
  
  # Install Alacritty
  echo "Installing Alacritty..."
  git clone git@github.com:alacritty/alacritty.git
  cd alacritty
  make app
  cp -r target/release/osx/Alacritty.app /Applications/
  cd ..
  rm -rf alacritty
  mkdir "$HOME/.config/alacritty"
  echo "Alacritty installed."

  # Install Hack Nerd Font
  echo "Installing Hack Nerd Font..."
  cp "$REPO_DIR/fonts/Hack-Regular-Nerd-Font-Complete.ttf" "$HOME/Library/Fonts/"
  echo "Hack Nerd Font installed."

  # Configure lazygit
  echo "Configuring lazygit..."
  cp -r "$REPO_DIR/lazygit" "$HOME/Library/Application\ Support/lazygit/"

  # Create symlinks for dotfile configs
  ln -s "$REPO_DIR/dotfiles/.zshrc" "$HOME/.zshrc"
  ln -s "$REPO_DIR/dotfiles/starship.toml" "$HOME/.config/starship.toml"
  ln -s "$REPO_DIR/dotfiles/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
  ln -s "$REPO_DIR/nvim/" "$HOME/.config/nvim"

  # Confirm success
  echo ""
  echo "Success! Installation completed."
fi
