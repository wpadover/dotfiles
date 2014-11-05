set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set number

syntax on
execute pathogen#infect()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
