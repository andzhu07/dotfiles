set nocompatible
syntax on
set number
set ruler
set autoindent
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set clipboard=unnamed
set vb t_vb=""
filetype plugin indent on

set t_Co=256
color peachpuff
hi Comment ctermfg=green

call plug#begin()
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
call plug#end()

augroup autoformat_settings
  autocmd FileType c,cpp,javascript AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType markdown AutoFormatBuffer prettier
augroup END

set mouse=a

nnoremap S :%s//g<Left><Left>

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
