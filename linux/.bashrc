# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific aliases and functions
alias ls='ls -lhF --color=auto'
alias ll='ls -al'
alias rm='rm -i'
alias gi='gvim'
alias vi='gvim'
alias cp='cp -p'
alias minicom='minicom --color=on'

function cd {
    builtin cd "$@" && ls
    #builtin cd "$@" && \ls -F --color=auto
}

# Prompt
source ~/.git-prompt.sh
export PS1=" \[\e[33;2m\]\w \[\e[35;1m\]\$(__git_ps1)    \[\e[33;2m\]{\D{%m/%d %H:%M}}\[\e[0m\]\n[\u] "
    #export PS1="\[\e[33;2m\][\w]\[\e[0m\] "

# Add local bin
export PATH=$PATH:~/bin

# SmartGit Client
export SMARTGIT_JAVA_HOME=/usr/bin/java:$SMARTGIT_JAVA_HOME

######################################################################
### PMC and Tensilica Settings ###
# Currently use RF-2014.0 for PMC
export XPLORER_VERSION=RF-2014.0
    #export XPLORER_VERSION=RF-2015.2

export INSTALL_ROOT=~/basil_release

export XTINSTALL=/home/jhkim/xtensa/XtDevTools
export LD_LIBRARY_PATH=$XTINSTALL/install/tools/$XPLORER_VERSION-linux/XtensaTools/lib:$XTINSTALL/install/tools/$XPLORER_VERSION-linux/XtensaTools/lib/iss

## Firmware path ##
export FW_ROOT=/home/jhkim/Work/PMC/pmc_git_devel
#export EFC_FW_PATH=/home/jhkim/Work/PMC/Belmar_ws0/firmware/EFC
#export EFC_FW_PATH=/home/jhkim/Work/PMC/Belmar_ws_2_2_0_RC8/firmware/EFC

## Simulator path ##
# Simulator 1.1.1 needs EFC 2.2.0 alpha
export SIMUL_ROOT=/home/jhkim/PMC/pmc_git_devel/simulator
# Simulator 1.1.0 needs EFC 2.2.0 RC4
#export ARCHSIM_EXE_PATH=/home/jhkim/PMC/PMC_Simulator_Release_1_1_0/archsim/run
# Simulator 1.0.0 needs EFC 2.1.1
#export ARCHSIM_EXE_PATH=/home/jhkim/PMC/PMC_Simulator_Release_1_0_0/archsim/run

export make_ctags=1
source ~/PMC/pmc_git_devel/setupenv.sh

