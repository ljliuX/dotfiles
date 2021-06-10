[[ $- != *i* ]] && return

shopt -s histappend
shopt -s checkwinsize
[[ $- =~ i ]] && stty -ixoff -ixon

PS1='[\u@\h \W]\$ '

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "

export EDITOR=nvim

alias ls='ls --color=auto'
alias ll='ls -l'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
