
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples

setopt autocd              # change directory just by typing its name
setopt correct             # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

#nvim
export EDITOR=nvim
export VISUAL=nvim

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Navigation
alias ...="../.."
alias ....="../../../"
# Ls
alias l='lsd --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
# Bat
alias batn="bat --style=plain"
alias batnp="bat --style=plain --paging=never"
# Kitty
alias kat="kitty +kitten icat"
# Clear 
alias c="/usr/bin/clear"
alias clear="/usr/bin/clear"
# Exit 
alias q="exit"
# Reset
alias reset="reset xterm"
# Ranger
alias ranger="ranger 2>/dev/null"
# Zsh
alias zconf="nvim ~/.zshrc"
alias szconf="source ~/.zshrc"
# AutomateBG
alias wp="/home/casa/.config/hypr/resources/automate_bg.sh &"

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

bindkey -M viins '^[[H' beginning-of-line     # Home
bindkey -M viins '^[[F' end-of-line           # End
bindkey -M viins '^[[3~' delete-char          # Supr
bindkey -M viins '^[[2~' overwrite-mode       # Insert (opcional)
bindkey -M viins '^[[5~' up-line-or-history   # Page Up
bindkey -M viins '^[[6~' down-line-or-history # Page Down

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

function fdir(){
  myDir=$(find . -type d 2>/dev/null | fzf --preview='tree {} 2>/dev/null')
  if [ '$myDir' != '' ]; then
    cd $myDir
  fi
}
function fnv() {
  file=$(fzf --preview='bat --color=always {} 2>/dev/null')
  if [ '$file' != '' ]; then
    nvim $file
  fi
}
function fdnv() {
  myDir=$(find . -type d 2>/dev/null | fzf --preview='tree {} 2>/dev/null')
  if [ '$myDir' != '' ]; then
    nvim $myDir
  fi
}

# H4U functions
function mkt(){
  mkdir {nmap,content,exploits,scripts}
}

function settarget(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > /home/elmago/.config/waybar/resources/target
}

function cleartarget(){
    echo '' > /home/elmago/.config/waybar/resources/target
}

# plugins
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-sudo/zsh-sudo.zsh ]; then
    . /usr/share/zsh/plugins/zsh-sudo/zsh-sudo.zsh
fi

source /home/elmago/Escritorio/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/elmago/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/elmago/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/elmago/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/elmago/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$PATH:/home/elmago/go/bin/"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/elmago/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/elmago/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
