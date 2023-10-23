export ZSH="$HOME/.oh-my-zsh"

# Themes (https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

# Setup oh my zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias tf="terraform"
alias vim="nvim"
alias lg="lazygit"
alias pip="pip3"

# Starship
eval "$(starship init zsh)"

