###############################################################################
# Fixes
###############################################################################
# Pasting long texts takes too much time
DISABLE_MAGIC_FUNCTIONS="true"

###############################################################################
# Configuration
###############################################################################
export PATH=${HOME}/.local/bin:$PATH
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
export FZF_CTRL_R_OPTS="\
  --with-nth 2.. --no-info\
  --wrap --bind 'ctrl-/:toggle-wrap' --wrap-sign '  ↳ '"
export FZF_DEFAULT_OPTS="\
  --color=fg:-1,fg+:#d0d0d0,bg:-1,bg+:#262626\
  --color=hl:#b4009e,hl+:#b4009e,info:#afaf87,marker:#b4009e\
  --color=prompt:#b4009e,spinner:#b4009e,pointer:#b4009e,header:#87afaf\
  --color=gutter:-1,border:#b4009e,query:#d9d9d9\
  --border='rounded' --preview-window='border-rounded'\
  --marker='' --pointer='' --prompt='❯ '"

###############################################################################
# Movement
###############################################################################
# Use Ctrl to move between words
bindkey '^H' backward-kill-word
bindkey -M emacs '^[[3;5~' kill-word

###############################################################################
# Plugins and themes
###############################################################################
source "${FLOX_ENV}/share/antigen/antigen.zsh"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"
autoload predict-on
autoload -U colors && colors
setopt promptsubst
antigen use oh-my-zsh
antigen bundle git
antigen bundle web-search && alias s='google'
antigen bundle sudo
antigen bundle dirhistory
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
eval "$(oh-my-posh init zsh --config .ohmyposh.toml)"
eval "$(zoxide init zsh)" && alias cd='z '
source <(fzf --zsh)

###############################################################################
# Autocomplete
###############################################################################
autoload -Uz compinit && compinit && source <(kubectl completion zsh)
complete -o nospace -C /usr/bin/terraform terraform

###############################################################################
# Aliases
###############################################################################
for f in .*.rc(N); do source "$f"; done;
