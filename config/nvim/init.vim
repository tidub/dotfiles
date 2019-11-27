set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
let g:vimtex_compiler_progname = 'nvr'
let g:python3_host_prog = '/usr/local/bin/python3'
set guicursor=
