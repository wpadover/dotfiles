execute pathogen#infect()

set t_Co=256

syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set smartindent
set guifont=Menlo:h16
set guioptions=T
set background=dark
set nobackup
set showmode
set showcmd
set ttyfast
set laststatus=2
set history=1000
set smartcase
set ignorecase
set incsearch
set splitbelow
set splitright
set title
set backspace=indent,eol,start
set ruler
set hlsearch
set scrolloff=3
set sidescroll=1
set sidescrolloff=10
set noswapfile

set clipboard=unnamed

if &background == "dark"
   hi normal guibg=black
endif

set laststatus=2

set nu

" Shift+Tab to inverse tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

colorscheme molokai

" Trim trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

set cursorline

" Highlight lines over 80 characters
match ErrorMsg '\%>80v.\+'

" Highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" When the window is resized, fix splits
au VimResized * exe "normal! \<c-w>="

" Improve scrolling when lines wrap around
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

"see :help statusline
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P



"Plugins
"NERDTree
" If no files, use NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1

" include ctrpl
set runtimepath^=~/.vim/bundle/ctrlp.vim

" So ctrl-p and nerdtree play nice
let g:ctrlp_dont_split = 'NERD_tree_2'

" jshint syntax checking
let g:syntastic_javascript_checkers = ['jshint']

