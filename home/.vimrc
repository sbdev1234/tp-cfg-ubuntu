let &t_VS = "\<ESC>[1 q"
let &t_EI = "\<Esc>[1 q"
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
set notimeout
set ttimeout
set timeoutlen=100

syntax on

set cursorline

highlight Comment term=bold ctermfg=Green guifg=Green gui=bold

set number relativenumber
set wildmode=longest,list,full
set splitbelow splitright
set mouse=a
set ruler
set clipboard=unnamedplus
set hls
set belloff=all

set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab


map <F6> :setlocal spell! spelllang=en_gb

