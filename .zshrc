export TERM="xterm-256color"
source /usr/share/zsh/scripts/zplug/init.zsh
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

# ZSH Theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
#ZSH_THEME="powerlevel9k/powerlevel9k"

# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable rbenv vcs ssh)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time ip)
# Up-down history
zplug "zsh-users/zsh-history-substring-search"

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2 

# A next-generation cd command with an interactive filter
zplug "b4b4r07/enhancd", use:init.sh

# Adds highlighting to tab-completion
zstyle ':completion:*' menu select

# When you do an ls command, this tusn all directories into a color
eval `dircolors -b`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Auto CD by typing in directory
setopt autocd
export EDITOR=vim

# Aliases
alias ll='ls --color'
alias l='ls --color'
alias ls='ls --color'
alias grep='grep --color=auto'
alias c='clear'
alias sp='sudo pacman-optimize && sudo pacman -Syu --noconfirm'
alias pa='pacaur -Syu'
alias v='sudo vim'
alias sx='startx'

# Git
alias gc='git clone'
alias gp='git push origin master'
alias ga='git add'
alias gcm='git commit -m'
alias gs='git status'
alias uz='unzip'
alias dp='drive push'
alias m='make'
alias mc='make clean'
alias rf='rm -rf'
alias ss='sudo systemctl start'
alias se='sudo systemctl enable'
alias sr='sudo systemctl restart'

alias gb='sudo gulp build'
alias ns='sudo npm start'

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000

# Key Bindings for XPS 9550
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-pattern-search-backward

# Zplug Bindings
bindkey '^[[3~' delete-char

# ZPlug zfish completion when pressing up and down on arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^[Oc'  forward-word     #Ctrl + right
bindkey '^[[c'  forward-word     #Ctrl + Shift + right
bindkey '^L'    forward-word     #Ctrl + L

bindkey '^[Od'  backward-word       #Ctrl + left
bindkey '^[[d'  backward-word       #Ctrl + Shift + left
bindkey '^H'    backward-word       #Ctrl + L
bindkey '^[[Z' reverse-menu-complete

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
fi

# if [ "$TMUX" = "" ]; then
#         tmux;
# fi

#Load zplug
zplug load
