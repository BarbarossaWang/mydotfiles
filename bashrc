#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# alias
alias scml='mit-scheme --load'
alias p='python'
alias v='vim'
alias la='ls -alt'
alias enw='emacs -nw --color=no'
