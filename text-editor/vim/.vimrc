" VIMRC
" settings for vim

" vim plug
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Heliferepo/VimTek'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
call plug#end()

" gui settings
set title
set titlestring=VIM:%F
set ruler
set number
set relativenumber
set colorcolumn=80
set background=dark
colorscheme iceberg

function! EnterCursorBar()
	exec ':! echo -e -n "\x1b[\x36 q"'
endfunction

command! EnterCursorBar call EnterCursorBar()

" cursor
set shell=/usr/bin/fish

" airline
let g:airline_left_sep='>'
let g:airline_theme='serene'
let g:airline#extensions#cursormode#enabled = 1

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

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_c_compiler_options = ' -Wall -Wextra -Wpedantic'
let g:syntastic_c_include_dirs = [ "lib/include", "include", "../include", "../lib/include"]
