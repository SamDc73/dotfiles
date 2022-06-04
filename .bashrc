# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ "$PS1" = "" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.local/share/shell/bash_history

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ "$force_color_prompt" != "" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Load aliases and shortcuts if existent.
if [ -f ~/.config/shell/aliasrc ]; then
    . ~/.config/shell/aliasrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# ====================CONFIG THIS =============================== #
export COLOR_01="#75715e"           # HOST
export COLOR_02="#f92672"           # SYNTAX_STRING
export COLOR_03="#a6e22e"           # COMMAND
export COLOR_04="#f4bf75"           # COMMAND_COLOR2
export COLOR_05="#66d9ef"           # PATH
export COLOR_06="#ae81ff"           # SYNTAX_VAR
export COLOR_07="#2AA198"           # PROMP
export COLOR_08="#f9f8f5"           #

export COLOR_09="#272822"           #
export COLOR_10="#f92672"           # COMMAND_ERROR
export COLOR_11="#a6e22e"           # EXEC
export COLOR_12="#f4bf75"           #
export COLOR_13="#66d9ef"           # FOLDER
export COLOR_14="#ae81ff"           #
export COLOR_15="#2AA198"           #
export COLOR_16="#f8f8f2"           #

export BACKGROUND_COLOR="#272822"   # Background Color
export FOREGROUND_COLOR="#f8f8f2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Monokai Dark"
# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "$SCRIPT_PATH")"



# z.lua (cd command that helps you navigate faster by learning your habits.)
eval "$(lua ~/.config/shell/z.lua --init bash enhanced once fzf)"

# oh-my-posh theme
eval "$(oh-my-posh init bash)"
eval "$(oh-my-posh init bash --config ~/.config/poshthemes/pure.omp.json)"

# Turn off beepset
set bell-style none
