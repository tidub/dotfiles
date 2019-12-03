source /usr/local/share/antigen/antigen.zsh

# load oh-my-zsh library
antigen use oh-my-zsh

# bundles from oh-my-zsh
antigen bundle pip
antigen bundle command-not-found
antigen bundle fasd
antigen bundle common-aliases
antigen bundle compleat
antigen bundle osx
antigen bundle web-search
antigen bundle vi-mode

# bundles from zsh-users
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# load theme
antigen theme gnzh

# tell antigen you're done
antigen apply

# aliases
alias ddg='web_search duckduckgo'
alias latex-make='latexmk -pdf -pvc file.tex'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'

