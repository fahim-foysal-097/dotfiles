#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rm='trash-put'
alias c='clear'
alias e='exit'

# Paru alias
alias parupg='paru -Syu'
alias pareps='paru -Ss'
alias parin='paru -S'

PS1='[\u@\h \W]\$ '

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/pure.omp.json)"
export PATH="$HOME/development/flutter/bin:$PATH"

# Others

#fastfetch

