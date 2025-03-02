
[[ $- != *i* ]] && return

alias ls='eza --icons'
alias grep='grep --color=auto'

PS1='\[\e[38;5;219m\]$\[\e[39m\] \[\e[38;5;219m\]\W\[\e[39m\] \[\e[0m\]'


export PATH=$PATH:/home/metodico/.spicetify
