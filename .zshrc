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

# Enable natural text editing
bindkey "^[[1;9D" beginning-of-line # Move to the beginning of the line. `Cmd + Left Arrow`:
bindkey "^[[1;9C" end-of-line # Move to the end of the line. `Cmd + Right Arrow`:
bindkey "^[[1;3D" backward-word # Move to the beginning of the previous word. `Option + Left Arrow`:
bindkey "^[[1;3C" forward-word # Move to the beginning of the next word. `Option + Right Arrow`:
bindkey "^[[3;10~" backward-kill-word # Delete the word behind the cursor. `Option + Delete`:
bindkey "^[[3;3~" kill-word # Delete the word after the cursor. `Option + fn + Delete`:

