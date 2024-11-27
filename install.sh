#!/usr/bin/env zsh

REPO_DIR=$(git rev-parse --show-toplevel)

# Remove existing dotfile configs (clean slate)
rm -f "$HOME/.zshrc"
rm -f "$HOME/.config/starship.toml"
rm -rf "$HOME/.config/alacritty"
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/Library/Application Support/lazygit"

# Create symlinks for dotfile configs
print -P "%F{green}Creating symlinks for dotfile configs..."
mkdir "$HOME/.config/alacritty"
ln -s "$REPO_DIR/dotfiles/.zshrc" "$HOME/.zshrc"
ln -s "$REPO_DIR/dotfiles/starship.toml" "$HOME/.config/starship.toml"
ln -s "$REPO_DIR/dotfiles/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -s "$REPO_DIR/nvim/" "$HOME/.config/nvim"
print -P "%F{green}Symlinks created."

# Install oh-my-zsh
#TODO

# Install neovim
#TODO

# Install starship
#TODO

# Install Homebrew
TEMP_DIR=$(mktemp -d)
HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
print -P "%F{green}Installing Homebrew..."
curl -fsSL "$HOMEBREW_URL" -o "$TEMP_DIR/install.sh"
/bin/bash "$TEMP_DIR/install.sh"
rm -rf "$TEMP_DIR"
print -P "%F{green}Homebrew installed."

# Install Homebrew apps
print -P "%F{green}Installing Homebrew apps..."
brew install awscli helm kubectx k8sec lazygit ripgrep tfenv tflint terraform-docs tree-sitter
print -P "%F{green}Homebrew apps installed."

# Install Rust (dependency for Alacritty)
print -P "%F{green}Installing Rust..."
curl https://sh.rustup.rs -sSf | sh
"export PATH=$HOME/.cargo/bin:$PATH" >> "$HOME/.zshrc"
source "$HOME/.zshrc"
print -P "%F{green}Rust installed."

# Install Alacritty
print -P "%F{green}Installing Alacritty..."
git clone git@github.com:alacritty/alacritty.git
cd alacritty
make app
cp -r target/release/osx/Alacritty.app /Applications/
cd ..
rm -rf alacritty
print -P "%F{green}Alacritty installed."

# Install Hack Nerd Font
print -P "%F{green}Installing Hack Nerd Font..."
cp "$REPO_DIR/fonts/HackNerdFontMono-Regular-Patched.ttf" "$HOME/Library/Fonts/"
print -P "%F{green}Hack Nerd Font installed."

# Confirm success
print -P "%F{green}\nSuccess! Installation completed."
