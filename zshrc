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
alias so='web_search stackoverflow'
alias w3='web_search duckduckgo site:w3schools.com'
alias latex-make='latexmk -pdf -pvc file.tex'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
alias fvim='nvim $(fzf)'

# make fzf option-c work:
bindkey "ç" fzf-cd-widget

#commands

# z jump to directory, open it in finder, cd to previous directory

z. () {
    z -p "$*"
    open .
    cd -
}

# mkdir, cd into it

mkcd () {
	mkdir -p "$*"
	cd "$*"
}
export PATH="/usr/local/sbin:$PATH"

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
