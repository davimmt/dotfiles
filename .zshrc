# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################################################################
# Fixes
###############################################################################
# Pasting long texts takes too much time
DISABLE_MAGIC_FUNCTIONS="true"

###############################################################################
# Configuration
###############################################################################
export PAGER=""
export VISUAL=nvim
export EDITOR="$VISUAL"

###############################################################################
# Movement
###############################################################################
# Use Ctrl to move between words
bindkey '^H' backward-kill-word
bindkey -M emacs '^[[3;5~' kill-word

###############################################################################
# Plugins and themes
###############################################################################
if [[ -f ~/.antigen/antigen.zsh ]]; then
  source ~/.antigen/antigen.zsh
else
  source $(find $NIX_STORE -maxdepth 4 -mindepth 4 -type f -name antigen.zsh -print -quit)
fi
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"
autoload predict-on
autoload -U colors && colors
autoload -Uz compinit && compinit
setopt promptsubst
antigen use oh-my-zsh
antigen bundle git
antigen bundle web-search && alias s='google'
antigen bundle sudo
antigen bundle dirhistory
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma-continuum/history-search-multi-word
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh && ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
antigen theme romkatv/powerlevel10k
#eval "$(oh-my-posh init zsh --config ${HOME}/.ohmyposh.toml)"
antigen apply

###############################################################################
# Autocomplete
###############################################################################
( autoload -Uz compinit && compinit && source <(kubectl completion zsh) ) 2> /dev/null
complete -o nospace -C /usr/bin/terraform terraform

###############################################################################
# Aliases
###############################################################################
source ~/.zprofile
setopt no_nomatch; for file in $(ls -A ~/.z.* 2> /dev/null); do source "$file"; done; setopt nomatch;
