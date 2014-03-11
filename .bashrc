# User dependent .bashrc file

# See man bash for more options...
  # Don't wait for job termination notification
  # set -o notify

  # Don't use ^D to exit
  # set -o ignoreeof

  # Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

# Some example alias instructions
#alias less='less -r'
alias rm='rm -i'
alias cp='cp -i'
#alias whence='type -a'
alias ls='ls -Flth --color=auto --show-control-char' 
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -lCF'
alias la='ls -A'

alias l='ls -alh'
alias gi='gvim'
alias vi='vim'
#alias vi='gvim'

# Some example functions
# function settitle() { echo -n "^[]2;$@^G^[]1;$@^G"; }

## Env setting ##
export LANG=eucKR

## Library ##


## Custom setting ##
export SVN_EDITOR=vim

## Shell style ##
#PS1="[\u@\w] "
export PS1="\[\e[33;2m\][\w]\[\e[0m\] "

eval `dircolors -b ~/.DIR_COLORS.custom`

