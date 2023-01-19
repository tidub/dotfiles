export PS1='[\s-\v] \w\n$ '
export PS2="> "

# set vim mode
set -o vi

# aliases
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias reload='source ~/.bash_profile'
. "$HOME/.cargo/env"
