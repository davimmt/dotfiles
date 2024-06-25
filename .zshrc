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
export PATH=~/.local/bin:$PATH
export PAGER=""
export VISUAL=nvim
export EDITOR="$VISUAL"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.

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
#antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle zdharma-continuum/history-search-multi-word
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh && ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
antigen theme romkatv/powerlevel10k
#eval "$(oh-my-posh init zsh --config ${HOME}/.ohmyposh.toml)"
antigen apply
eval "$(zoxide init zsh)" && alias cd='z '

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
