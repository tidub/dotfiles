let mapleader =" "

" Automatic installation of vim-plug:
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'      "in terminal: latexmk -pdf -pvc file.tex
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi'	  "pycharm style syntax highlighting
"Plug 'christoomey/vim-tmux-navigator' "navigate vim tmux splits 'ctrl+h/j/k/l'
call plug#end()

" Some basics:
 	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
	set nohls
	set relativenumber
	set selection=inclusive
        set background=light
	set guicursor=
	let g:tex_flavor = 'latex'

" Enable auto-completion:
	set wildmode=longest,list,full

" Disables automatic commenting on new line:
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo<CR>


" Spell-check set to <leader>o, 'o' for 'orthography':
"	map <leader>o :setlocal spell! spelllang=eng_us<CR>

" Splits open at the bottom and right:
	set splitbelow splitright

" Auto resize Vim splits to active split
	set winwidth=104
	set winheight=5
	set winminheight=5
	set winheight=999

" Revert to normal backspace
	set backspace=indent,eol,start

" Use enter to create new lines w/o entering insert mode
	nnoremap <CR> o<Esc>

" Below is to fix issues with the above mappings in quickfix window
	autocmd CmdwinEnter * nnoremap <CR> <CR>
	autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Clear search highlights with <escape>
	" nnoremap <esc> :noh<return><esc>

" Toggle relative line numbering with <leader>l
	fu! ToggleRelative ()
	  if &relativenumber
	    set norelativenumber
	  else
	    set relativenumber
	  endif
	endfunction

	map <silent><leader>l :call ToggleRelative()<CR>

"Toggle cursorline and cursorcolumn with <leader><space>
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

" Surround highlighted text with ' " ( [ { <
	xnoremap <leader>' xi''<Esc>P
	xnoremap <leader>" xi""<Esc>P
	xnoremap <leader>( xi()<Esc>P
	xnoremap <leader>[ xi[]<Esc>P
	xnoremap <leader>{ xi{}<Esc>P
	xnoremap <leader>< xi<><Esc>P

" Strong hjkl movement
	map $ <Nop>
	map ^ <Nop>
	map { <Nop>
	map } <Nop>
	noremap K     {
	noremap J     }
	noremap H     ^
	noremap L     $

" Quicker window movement
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-h> <C-w>h
	nnoremap <C-l> <C-w>l

" Automatically deletes all trailing whitespace on save:
	autocmd BufwritePre * %s/\s\+$//e

" Navigate properly when lines are wrapped
	nnoremap j gj
	nnoremap k gk

" Use tab to jump between blocks, because it's easier
	nnoremap <tab> %
	vnoremap <tab> %

" Improve colours
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

" source .vimrc with <leader>r
	map <leader>r :source ~/.vimrc<CR>

" reload: 		:source ~/.vimrc
" install plugins: 	:PlugInstall
" update plugins: 	:PlugUpdate
