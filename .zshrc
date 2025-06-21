# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="simple"

HISTFILE=~/.zsh_history
HISTSIZE=15000
SAVEHIST=15000
setopt appendhistory

bindkey '^R' history-incremental-search-backward
bindkey '^I^I' autosuggest-accept

alias v="nvim"
alias ls="ls --color"
alias homeaudio="ncmpcpp -h 192.168.0.100"
alias lg="lazygit"
alias acpoet='source $( poetry env list --full-path | grep Activated | cut -d" " -f1 )/bin/activate'
alias rutracker='RUTRACKER_USERNAME=$(pass show rutracker | grep -oP "username:\K.*") RUTRACKER_PASSWORD=$(pass show rutracker | head -n 1) rust_rutracker_cli'
alias weather='curl wttr.in/tyumen'
alias toggle_vpn='sudo toggle_vpn'

export WLR_NO_HARDWARE_CURSORS=1
export EDITOR=nvim
export SUDO_EDITOR=/usr/bin/nvim
export XDG_CURRENT_DESKTOP=Sway
export HOMEBREW_NO_AUTO_UPDATE=true

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


zinit light zsh-users/zsh-completions
zicompinit; zicdreplay

zinit light Aloxaf/fzf-tab
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit load zsh-users/zsh-syntax-highlighting 
zinit load zsh-users/zsh-autosuggestions
# zinit light marlonrichert/zsh-autocomplete

# use fzf menu for history search, etc
source <(fzf --zsh)


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

