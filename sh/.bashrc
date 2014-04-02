if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

show-git-branch()
{
    RET=$?
    git branch 2> /dev/null | sed '/^[^*]/d; s/^\*//'
    return $RET
}

git() {
  if [[ "$1" == 'merge' ]]; then
    echo 'Use git5 merge, not git merge. git merge does not understand how to merge the READONLY link and it can corrupt your branch, so stay away from it. type "unset -f git" to remove this warning';
  else
    command git "$@";
  fi;
}

export OS_TYPE=$(uname -s | sed 's/^\([[:alnum:]]*\)\(.*\)/\1/')

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" == yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;35m\]$(show-git-branch) \[\033[1;$((31+3*!$?))m\]\$\[\033[00m\] '
else
    PS1='\u@\h \w$(show-git-branch) \$ '
fi
unset color_prompt force_color_prompt

export PATH=~/dotfiles/tools/local:~/dotfiles/tools:~/dotfiles/env/local:~/dotfiles/env:/usr/local/bin:$PATH
export EDITOR="vim"

if [ $OS_TYPE == "Darwin" ]; then
    alias ls="ls -G"
elif [ $OS_TYPE == "Linux" ]; then
    alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias emacs="emacs -nw"
alias rm="rm -i"
alias mv="mv -i"
alias tmux="tmux -2"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias x='chmod +x'
alias init='source ~/.bashrc'
alias emacs="emacs -nw"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
if [ -x /usr/bin/notifysend ]; then
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -e ~/dotfiles/sh/.bashrc.local ]; then
    source ~/dotfiles/sh/.bashrc.local
fi
