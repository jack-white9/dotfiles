export ZSH="$HOME/.oh-my-zsh"

# Themes (https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git terraform kubectl)

# Setup oh my zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias tf="terraform"
alias vim="nvim"
alias pip="pip3"
alias lg="lazygit"
alias kcf="kraken cloudfarer"

# Starship
eval "$(starship init zsh)"

