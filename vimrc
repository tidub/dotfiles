let mapleader =" "

" automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" plugins managed with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'      "in terminal: alias latex-pdf=
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi'
"Plug 'christoomey/vim-tmux-navigator' "navigate vim tmux splits 'ctrl+h/j/k/l'
call plug#end()

" Basic settings
 	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
	set nohls
	set relativenumber
	set selection=inclusive
        set background=light
	set guicursor= 		"work-around for nvim/terminal cursor conflict
	let g:tex_flavor = 'latex'

" Enable auto-completion
	set wildmode=longest,list,full

" Disables automatic commenting on new line
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Toggle Goyo plugin for more readable text
	map <leader>f :Goyo<CR>

" Toggle spell-check
	map <silent><leader>s :setlocal spell! spelllang=en<CR>

" Splits open at the bottom and right
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

" Command to enter visual block mode from normal mode
" Used for comment/uncomment bindings below
	command! Vb normal! <C-v>

" Comment/uncomment from below cursor to next blank line
	map <leader>3 j :Vb<CR> JkI#<space><Esc>k
	map <leader>c j :Vb<CR> JkI"<space><Esc>k
	map <leader>x j :Vb<CR> JkxkH


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

" Automatically deletes all trailing whitespace on save
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

" Source vimrc file
	map <leader>r :source ~/.vimrc<CR>

" install plugins: 	:PlugInstall
" update plugins: 	:PlugUpdate
