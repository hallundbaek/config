# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
#zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
eval "$(dircolors -b ~/.zsh/dircolors.256dark)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose false

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#Plugins
source /home/tobias/.zsh/plugins/poverlevel9k/powerlevel9k.zsh-theme
source /home/tobias/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/tobias/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# POWERLEVEL9K
POWERLEVEL9K_MODE='awesome-patched'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
# aliases
alias rootwine="WINEPREFIX=/home/yourusername/.wine_root wine" 
alias wthr="curl -s wttr.in/copenhagen | head -n -2"
alias ls="ls --color=auto"
alias diku="~/.screenlayout/diku.sh"
alias deon="~/.screenlayout/deon.sh"
alias l="ls -lth --color=auto"
alias cd..="cd .."
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey 'OA' history-substring-search-up
bindkey 'OB' history-substring-search-down
zmodload zsh/complist
bindkey '[Z' reverse-menu-complete

#exports
export GOPATH=$HOME/go
export PATH=$PATH:~/.local/bin:$GOPATH/bin
