# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
let $PYTHONPATH='/usr/lib/python3.6/site-packages'
set laststatus=2
alias vi=vim

if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
alias clear="clear && source /home/avinash/.bashrc"
cat<<"EOF"                                                                              
                                                                              
    ,---,                 ,--,                                                
  ,--.' |               ,--.'|                                          ,---, 
  |  |  :               |  | :                   ,---,                ,---.'| 
  :  :  :               :  : '    .--.--.    ,-+-. /  |               |   | : 
  :  |  |,--.  ,--.--.  |  ' |   /  /    '  ,--.'|'   |  ,--.--.      |   | | 
  |  :  '   | /       \ '  | |  |  :  /`./ |   |  ,"' | /       \   ,--.__| | 
  |  |   /' :.--.  .-. ||  | :  |  :  ;_   |   | /  | |.--.  .-. | /   ,'   | 
  '  :  | | | \__\/: . .'  : |__ \  \    `.|   | |  | | \__\/: . ..   '  /  | 
  |  |  ' | : ," .--.; ||  | '.'| `----.   \   | |  |/  ," .--.; |'   ; |:  | 
  |  :  :_:,'/  /  ,.  |;  :    ;/  /`--'  /   | |--'  /  /  ,.  ||   | '/  ' 
  |  | ,'   ;  :   .'   \  ,   /'--'.     /|   |/     ;  :   .'   \   :    :| 
  `--''     |  ,     .-./---`-'   `--'---' '---'      |  ,     .-./\   \  /   
             `--`---'                                  `--`---'     `----'    
                                                                              

EOF
alias india="TZ='Asia/Kolkata' date"
