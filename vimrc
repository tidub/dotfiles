if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"toggle relative line numbers on / off
function! Relative()
    if &relativenumber
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

"toggle search highlights on / off
function! HLS()
    if &hls
        set nocursorline
        set nocursorcolumn
        set nohls
    else
        set cursorline
        set cursorcolumn
        set hls
    endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
"Plug 'numirias/semshi'
call plug#end()

let mapleader =" "

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let $FZF_DEFAULT_OPTS = '--height 40%'
let g:tex_flavor = 'latex'

filetype plugin indent on
colorscheme gruvbox

set nocompatible
set clipboard=unnamed
set encoding=utf-8
set number
set hls
set selection=inclusive
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set splitbelow splitright

"automatically resize splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

"use backspace as normal
set backspace=indent,eol,start

"enable auto-completion
set wildmode=longest,list,full

"delete trailing whitespace on save
autocmd BufwritePre * %s/\s\+$//e

"disable automatic commenting on new line
autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"fix for mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

autocmd BufEnter *.md set conceallevel=0
"autocmd FileType markdown setlocal conceallevel=0
autocmd FileType markdown normal zR

"use H / L to move cursor to beginning / end of line
map ^ <Nop>
map $ <Nop>
noremap H ^
noremap L $

"use J / K to move cursor to next / previous blank line
map } <Nop>
map { <Nop>
noremap J }
noremap K {

"use tab to jump matching () {} []
map % <Nop>
noremap <tab> %

"use enter to create new lines
nnoremap <CR> o<Esc>

"navigate wrapped lines
nnoremap j gj
nnoremap k gk

"use leader <symbol> to surround highlighted text with <symbol>
xnoremap <leader>' xi''<Esc>P
xnoremap <leader>" xi""<Esc>P
xnoremap <leader>( xi()<Esc>P
xnoremap <leader>[ xi[]<Esc>P
xnoremap <leader>{ xi{}<Esc>P
xnoremap <leader>< xi<><Esc>P

"move lines up and down with alt-j/k
nnoremap ˚ :move-2<CR>==
nnoremap ∆ :move+<CR>==
xnoremap ˚ :move-2<CR>gv=gv
xnoremap ∆ :move'>+<CR>gv=gv

"use leader <tab> to remove pair of brackets
nnoremap <leader><tab> %x``x

"visual-block command for comment/uncomment bindings below
command! Vb normal! <C-v>

"use leader c / " to comment out block with # / quote
map <leader>c j :Vb<CR> JkI#<space><Esc>k
map <leader>" j :Vb<CR> JkI"<space><Esc>k

"use leader x uncomment / delete first character of block
map <leader>x j :Vb<CR> JkxkH

map <leader>g :Goyo<CR>
map <leader>n :NERDTreeToggle<CR>
map <silent><leader>s :setlocal spell! spelllang=en<CR>

map <silent><leader>l :call Relative()<CR>
map <silent><leader><space> :call HLS()<CR>

map <leader>R :source ~/.vimrc<CR>

