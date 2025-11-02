#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export PATH=$PATH:/home/fahim/.local/bin
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"


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


# Others

#fastfetch

