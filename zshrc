#!/bin/zsh

source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
  zgen oh-my-zsh themes/gnzh
  zgen save
fi

#PS1=' ▶ '

eval "$(zoxide init zsh)"

export EDITOR='nvim'

export BAT_THEME="gruvbox-dark"

export SKIM_DEFAULT_COMMAND="fd --type f"

export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

bindkey -v

function reboot() {
    osascript -e 'tell app "loginwindow" to «event aevtrrst»'
}

function shutdown() {
    osascript -e 'tell app "loginwindow" to «event aevtrsdn»'
}

alias c="code"
alias ca="cargo"
alias cs="clear"
alias fdd="fd -t d"
alias fd1="fd -d 1"
alias fd2="fd -d 2"
alias fd3="fd -d 3"
alias g="git"
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff'
alias gst='git status'
alias l="exa -1"
alias la="exa -1 -a"
alias ll="exa -l"
alias ls="exa"
alias n="nvim"
alias nvimrc="nvim $HOME/dotfiles/vimrc"
alias nzshrc="nvim $HOME/dotfiles/zshrc"
alias o="open"
alias sleep="pmset sleepnow"
alias sw="swift"
alias tp="~/rust/tap/target/release/tap ~/slsk"
alias tree="exa --tree"
alias zshrc="source $HOME/.zshrc"
alias zz="z -"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/.fzfrc
