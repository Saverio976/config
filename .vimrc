" VIMRC
" settings for vim

" vim plug
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'Heliferepo/VimTek'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
call plug#end()

" gui settings
set title
set titlestring=VIM:%F
set ruler
set number
set colorcolumn=80
set background=dark
colorscheme iceberg

" cursor
autocmd BufWinEnter * :! echo -e -n "\x1b[\x36 q"]
set shell=/usr/bin/bash

" auto popup
autocmd VimEnter * ApcEnable
let g:apc_enable_ft = {'text':1, 'make':1, 'c':1, 'sh':1}
set cpt=.,k,w,b
set completeopt=menu,menuone,noselect
set shortmess+=c

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeDirArrows=1
