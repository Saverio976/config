" VIMRC
" settings for vim

set nocompatible

" vim plug
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
" Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Heliferepo/VimTek'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'itchyny/vim-cursorword'
" Plug 'itchyny/screensaver.vim'
Plug 'rhysd/open-pdf.vim'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

set cursorline

set mouse=a

set ttyfast

set title
set titlestring=%f
set ruler
set number
set relativenumber
set colorcolumn=80
set background=dark
colorscheme iceberg

set nowrap

function! EnterCursorBar()
	exec ':! echo -e -n "\x1b[\x36 q"'
endfunction

command! EnterCursorBar call EnterCursorBar()

" cursor
set shell=/bin/zsh

" airline
let g:airline_left_sep='>'
let g:airline_theme='serene'
let g:airline#extensions#cursormode#enabled = 1

" menucompletion
set completeopt=menu,menuone,noselect
set completeopt-=preview

" auto completion
let g:ycm_global_ycm_extra_conf = '~/.src/SAMPLE_C_PROJECT/.ycm_global_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
"let g:ycm_add_preview_to_completeopt = 1

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeDirArrows=1
let NERDTreeIgnore=['\.o$', '\.a$', '__pycache__$']
let NERDTreeWinSize=25

" syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_signs = 1
"let g:syntastic_echo_current_error = 1
"let g:syntastic_c_compiler_options = ' -Wall -Wextra -Wpedantic'
"let g:syntastic_c_include_dirs = [ "lib/include", "include", "../include", "../lib/include"]

" YouCompleteMe
let g:pdf_cache_dir=$HOME.'/.vim/.open-pdf.vim.cache'
