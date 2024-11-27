#!/usr/bin/env zsh

REPO_DIR=$(git rev-parse --show-toplevel)

# Remove existing dotfile configs (clean slate)
rm -f "$HOME/.zshrc"
rm -f "$HOME/.config/starship.toml"
rm -rf "$HOME/.oh-my-zsh"
rm -rf "$HOME/.config/alacritty"
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/Library/Application Support/lazygit"

# Install oh-my-zsh
print -P "%F{green}Installing oh-my-zsh..."
print -P "%F{red}NOTE: INTERACTIVE PROMPT WILL APPEAR. TYPE 'exit' TO CONTINUE INSTALLATION."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f "$HOME/.zshrc"
print -P "%F{green}oh-my-zsh installed."

# Create symlinks for dotfile configs
print -P "%F{green}Creating symlinks for dotfile configs..."
mkdir "$HOME/.config/alacritty"
ln -s "$REPO_DIR/dotfiles/.zshrc" "$HOME/.zshrc"
ln -s "$REPO_DIR/dotfiles/starship.toml" "$HOME/.config/starship.toml"
ln -s "$REPO_DIR/dotfiles/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -s "$REPO_DIR/nvim/" "$HOME/.config/nvim"
print -P "%F{green}Symlinks created."

# Install starship
print -P "%F{green}Installing starship..."
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
print -P "%F{green}starship installed."

# Install Homebrew
print -P "%F{green}Installing Homebrew..."
sh -c $(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh")
print -P "%F{green}Homebrew installed."

# Install Homebrew apps
print -P "%F{green}Installing Homebrew apps..."
brew install awscli helm kubectx k8sec lazygit neovim ripgrep tfenv tflint terraform-docs tree-sitter
print -P "%F{green}Homebrew apps installed."

# Install Rust (dependency for Alacritty)
print -P "%F{green}Installing Rust..."
curl https://sh.rustup.rs -sSf | sh
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
source ~/.zshrc
print -P "%F{green}\nSuccess! Installation completed."
