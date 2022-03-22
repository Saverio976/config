lua require('plugins')

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf8

autocmd BufWinEnter * set cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinEnter * set nocursorline

set ttyfast
set lazyredraw

set tabstop=4
set shiftwidth=4
set cindent

set noshowmode

set ruler
set colorcolumn=80

set number
set relativenumber
set nowrap

set wildignore=*.docx,*.jpg,*.gif,*.pyc,*.o,*.a,*.odt

set completeopt=menu,menuone,noselect
set completeopt-=preview

syntax on

set background=dark
colorscheme nightfox

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_global_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_semantic_triggers = { 'c': ['->', '.', 're!\w{2}'] }
let g:ycm_add_preview_to_completeopt = 0

" vim-cpp-moder
let g:cpp_function_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

" wilder
call wilder#setup({'modes': [':', '/', '?']})

" vim-auto-save
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" vim-move
let g:move_map_keys = 0
nmap <C-k> <Plug>MoveLineUp
nmap <C-j> <Plug>MoveLineDown
vmap <C-k> <Plug>MoveLineUp
vmap <C-j> <Plug>MoveLineDown
