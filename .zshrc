setopt appendhistory autocd extendedglob notify correctall nomatch globdots
unsetopt beep

#Load the plugins for zsh
#source $HOME/.zsh-plugins/arch.zsh
source $HOME/.zsh-plugins/sudo.zsh
source $HOME/.zsh-plugins/git/zsh-autocomplete/zsh-autocomplete.plugin.zsh

eval "$(starship init zsh)"

#Custom aliases
alias ls=lsd
alias l='lsd -l'
alias la='lsd -la'
alias c='clear'

source /usr/share/doc/find-the-command/ftc.zsh

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

#Preserve history
SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history

#Fix the delete key
bindkey "^[[3~" delete-char
export PATH=$PATH:$HOME/.local/bin

