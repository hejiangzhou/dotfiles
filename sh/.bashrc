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

export OS_TYPE=$(uname -s | sed 's/^\([[:alnum:]]*\)\(.*\)/\1/')
export PATH=~/dotfiles/tools:~/dotfiles/env:/usr/local/bin:$PATH
export EDITOR="vim"
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;35m\]$(show-git-branch) \[\033[1;$((31+3*!$?))m\]\$\[\033[00m\] '

if [ $OS_TYPE == "Darwin" ]; then
    alias ls="ls -G"
elif [ $OS_TYPE == "Linux" ]; then
    alias ls="ls --color=auto"
fi
alias emacs="emacs -nw"
alias rm="rm -i"
alias mv="mv -i"
alias tmux="tmux -2"

if [ -e ~/dotfiles/sh/.bashrc.local ]; then
    source ~/dotfiles/sh/.bashrc.local
fi

