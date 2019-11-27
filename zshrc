source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
# antigen bundle autojump
antigen bundle fasd
antigen bundle brew
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle npm
antigen bundle osx
antigen bundle web-search
antigen bundle vi-mode
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme gnzh

# Tell antigen that you're done.
antigen apply


# Alias for CLI VLC
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I rc"
alias ddg="web_search duckduckgo"


# Setup zsh-autosuggestions
# source /Users/tim/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh



# Enable autosuggestions automatically

# zle-line-init() {
    # zle autosuggest-start
# }
#
# zle -N zle-line-init
#
