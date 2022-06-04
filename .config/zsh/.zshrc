# MAKE ZSH FASTER
# source ~/.config/zsh/plugins/instant-zsh.zsh
# instant-zsh-pre '%n@%m %~%# '

###############################################
#Start up application and Enviromintal virables
###############################################

# Clipboard manager 
# wl-paste -t text --watch clipman store &

# Export bin 
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/cargo/bin:$HOME/.local/share/zap/v2:$HOME/.local/share/applications

# Default apps 
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

###############################################

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.
# stty stop undef		# Disable ctrl-s to freeze terminal.
bindkey -e  #Emacs keybindings

# History in cache directory:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.local/share/shell/zsh_history
unsetopt EXTENDED_HISTORY

## History command configuration
# setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data


# Load aliases and shortcuts if existent.
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Basic auto/tab complete:
# autoload -U compinit
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
CASE_SENSITIVE="false"

# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
# unsetopt LIST_BEEP

## kitty-integration V1
function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}
function set-title-preexec() {
  printf "\e]2;%s\a" "$1"
}
autoload -Uz add-zsh-hook
# add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec

## kitty integration
# if test -n "$KITTY_INSTALLATION_DIR"; then
#   export KITTY_SHELL_INTEGRATION="enabled"
#   autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
#   kitty-integration
#   unfunction kitty-integration
# fi

#### plugins
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
#source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/.config/zsh/plugins/sudo.zsh
source ~/.config/zsh/plugins/dirhistory.zsh
source ~/.config/zsh/plugins/fzf-marks.plugin.zsh
source ~/.config/zsh/plugins/cheat.zsh
source ~/.config/zsh/plugins/colored-man-pages.plugin.zsh
# source ~/.config/zsh/plugins/copy-pasta.plugin.zsh
# source ~/.config/zsh/plugins/autopair.zsh
source ~/.config/zsh/plugins/qoutes.zsh
source ~/.config/zsh/plugins/fancy-ctrl-z.zsh

# z.lua (cd command that helps you navigate faster by learning your habits.)
eval "$(lua ~/.config/shell/z.lua --init zsh enhanced once echo)"
source ~/.config/zsh/plugins/czmod.zsh

# oh-my-posh theme
eval "$(oh-my-posh init zsh --config ~/.config/poshthemes/aliens.omp.json)"

# keybinds for zsh
# ctrl-o copy current command to the buffer

# pyenv
# export PYENV_ROOT="$HOME/.config/pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
#

# MAKE ZSH FASTER
# instant-zsh-post
