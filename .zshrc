export ZSH="$HOME/.oh-my-zsh"
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

ZSH_THEME="simple"

plugins=(git jsontools sudo)

zstyle ':omz:update' mode disabled
source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

export PATH=/home/nikita/.local/bin:$PATH
export WLR_NO_HARDWARE_CURSORS=1
export EDITOR=nvim
export SUDO_EDITOR=/usr/bin/nvim
