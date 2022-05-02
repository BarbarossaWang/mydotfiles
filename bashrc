#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

###########
# alias
###########
# shell tools
alias la='ls -alt'
# programming languages
alias p='python'
# editors
alias v='vim'
alias e='emacs'
alias c='code'
# git
alias gs='git status'
. "$HOME/.cargo/env"
