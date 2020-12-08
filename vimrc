" automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins managed with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'numirias/semshi'
call plug#end()

" basic settings

set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number
set nohls
set relativenumber
set selection=inclusive
set background=light
let g:tex_flavor = 'latex'

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
" filetype on
" autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let $FZF_DEFAULT_OPTS = '--height 40%'

" fix for nvim/terminal cursor conflict
set guicursor=

" use backspace as normal
set backspace=indent,eol,start

" enable auto-completion
set wildmode=longest,list,full

" splits open below / right
set splitbelow splitright

" automatically resize splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

" delete trailing whitespace on save
autocmd BufwritePre * %s/\s\+$//e

" disable automatic commenting on new line
autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" fix for mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" key-bindings

" use H / L to jump to beginning / end of line
map ^ <Nop>
map $ <Nop>
noremap H ^
noremap L $

" use J / K to jump next / previous blank line
map } <Nop>
map { <Nop>
noremap J }
noremap K {

" use tab to jump matching () {} []
map % <Nop>
noremap <tab> %

" use enter to create new lines
nnoremap <CR> o<Esc>

" use ctrl - h/j/k/l to move between splits
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" " use hyper - n to move to next split
" nnoremap <F2> <C-w><C-w>

" navigate wrapped lines
nnoremap j gj
nnoremap k gk

" leader-mappings

let mapleader =" "

" use leader <symbol> to surround highlighted text with <symbol>
xnoremap <leader>' xi''<Esc>P
xnoremap <leader>" xi""<Esc>P
xnoremap <leader>( xi()<Esc>P
xnoremap <leader>[ xi[]<Esc>P
xnoremap <leader>{ xi{}<Esc>P
xnoremap <leader>< xi<><Esc>P

" use leader <tab> to remove pair of brackets
nnoremap <leader><tab> %x``x

" visual-block command for comment/uncomment bindings below
command! Vb normal! <C-v>

" use leader c / " to comment out block with # / quote
map <leader>c j :Vb<CR> JkI#<space><Esc>k
map <leader>" j :Vb<CR> JkI"<space><Esc>k

" use leader x uncomment / delete first character of block
map <leader>x j :Vb<CR> JkxkH

" use leader l to toggle relative line number
fu! ToggleRelative ()
    if &relativenumber
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

map <silent><leader>l :call ToggleRelative()<CR>

" use leader space to toggle cursor line / column highlight
fu! ToggleCurline ()
    if &cursorline && &cursorcolumn
        set nocursorline
        set nocursorcolumn
        set nohls
    else
        set cursorline
        set cursorcolumn
        set hls
    endif
endfunction

map <silent><leader><space> :call ToggleCurline()<CR>

" use leader g to toggle goyo
map <leader>g :Goyo<CR>

map <leader>n :NERDTreeToggle<CR>

" use leader s to toggle spell-check
map <silent><leader>s :setlocal spell! spelllang=en<CR>

" use leader R to source vimrc
map <leader>R :source ~/.vimrc<CR>

" customise status line

" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

" :set statusline=%{StatuslineGit()}\ %F\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P

" hi User1 ctermfg=0 ctermbg=114

" set statusline=
" set statusline+=%1*                 "use highlight group User1
" set statusline+=%{StatuslineGit()}
" set statusline+=%#LineNr#           "use highlight group LineNr
" set statusline+=\ %F
" set statusline+=%m
" set statusline+=%=
" set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c

" improve colours

hi clear CursorLine
hi clear CursorColumn
hi clear CursorLineNr
hi Comment term=bold ctermfg=240
hi Visual term=reverse ctermfg=none ctermbg=234
hi LineNr term=none ctermfg=240
hi CursorLine term=none ctermfg=none ctermbg=236
hi CursorColumn term=none ctermfg=none ctermbg=236
hi CursorLineNr term=bold ctermfg=221 ctermbg=none
hi MatchParen ctermfg=232 ctermbg=221
hi Folded ctermfg=221 ctermbg=none
hi Search ctermfg=54
