# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
alias ls='ls --color=auto'
# User specific aliases and functions
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
export PYTHONPATH=/usr/lib/python3.6/site-packages
set laststatus=2
alias vi=vim

. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

alias clear="clear && source /home/avinash/.bashrc"
screenfetch 
alias india="TZ='Asia/Kolkata' date"
