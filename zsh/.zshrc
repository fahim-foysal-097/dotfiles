
##################
### ZSH CONFIG ###
##################

# Android SDK
# export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
# export ANDROID_HOME="$ANDROID_SDK_ROOT"

# SDK tools
# export PATH="$PATH:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin"

# Others
export PATH=$PATH:$HOME/.local/bin


eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab # fzf fuzzy finder
zinit light MichaelAquilina/zsh-you-should-use

# Add in snippets
zinit snippet OMZP::command-not-found
zinit snippet OMZP::archlinux
zinit snippet OMZP::sudo

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q # cache things - recommended

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '\e[H' beginning-of-line   # HOME key
bindkey '\e[F' end-of-line         # END key
bindkey "^[[3~" delete-char        # Del key

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase # erase duplicate
setopt appendhistory # appends to history instead of overwriting
setopt sharehistory # shares history across multiple session
setopt hist_ignore_space # doesn't save command starting with a space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups # doesn't show duplicate commands

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # makes completion case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

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

# Shell integrations
eval "$(fzf --zsh)" # fzf fuzzy finder


# Run fastfetch only if not inside VS Code terminal
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
    fastfetch
fi

