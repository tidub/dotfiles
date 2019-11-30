source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle pip
antigen bundle command-not-found
antigen bundle fasd
antigen bundle common-aliases
antigen bundle compleat
antigen bundle osx
antigen bundle web-search
antigen bundle vi-mode
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme gnzh

# Tell antigen that you're done.
antigen apply

# Aliases
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I rc"
alias ddg="web_search duckduckgo"

