#------------------------------------------------------------------#
# File:     .zshrc   ZSH resource file                             #
# Version:  0.0.1                                                  #
# Author:   Richard White										   #
#------------------------------------------------------------------#

#------------------------------
# History stuff
#------------------------------
HISTFILE=~/.histfile
HISTSIZE=1024
SAVEHIST=1024

#------------------------------
# Variables
#------------------------------
export EDITOR="vim"
export TERM=screen-256color
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export PATH=/usr/lib/colorgcc/bin:$(cope_path):$PATH:$HOME/.cabal/bin:/opt/java/bin/
#-----------------------------
# Dircolors
#-----------------------------
eval `dircolors /home/richard/Stuff/dircolors-solarized/dircolors.256dark`
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#------------------------------
# Alias stuff
#------------------------------
alias ls="ls --color -F"
alias wifi="sudo wifi-menu"
alias sd="sudo shutdown -h 0"
alias s="sudo s2ram --force"
alias power="sudo cpupower frequency-set -g performance"
alias vim='nocorrect vim'
alias vpn='sudo systemctl restart openvpn@client.service'
alias ise='/opt/Xilinx/14.6/ISE_DS/ISE/bin/lin64/ise'
alias em='TERM=xterm-16color emacsclient -nw -a ""'

#------------------------------
# Comp stuff
#------------------------------
autoload -U compinit
compinit
autoload -U promptinit
promptinit
prompt elite2 'magenta'
setopt correctall
setopt autocd
