" VIMRC
" settings for vim

" say that the color syntax could be better in tmux in tty
if $TERM == 'linux'
    echo "why did you struggle in tty ... because you wanna improve ? (type ENTER)"
endif

" set mouse for alacritty
if $TERM == 'alacritty'
    set ttymouse=sgr
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim plug
call plug#begin('~/.vim/plugged')

" window
Plug 'preservim/nerdtree'
if $TERM != 'linux'
    Plug 'ryanoasis/vim-devicons'
endif
Plug 'skywind3000/vim-terminal-help'
Plug 'itchyny/screensaver.vim'
Plug 'godlygeek/csapprox'
Plug 'yegappan/mru'
Plug 'chriskempson/base16-vim'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" sign colummn
Plug 'airblade/vim-gitgutter'

" epitech header
Plug 'Heliferepo/VimTek', { 'for': ['c', 'cpp', 'h'] }

" generate doxygen doc
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': ['c', 'cpp', 'h'] }

" text
Plug 'itchyny/vim-cursorword'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'bfrg/vim-cpp-modern'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rhysd/open-pdf.vim'
Plug 'brooth/far.vim'
Plug 'wincent/ferret'

" auto completion
Plug 'tabnine/YouCompleteMe'
Plug 'natebosch/vim-lsc', { 'for': ['dart'] }
Plug 'natebosch/vim-lsc-dart', { 'for': ['dart'] }

" syntax
Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }
Plug 'ollykel/v-vim'

" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'preservim/tagbar', { 'for': ['c' , 'cpp', 'h'] }

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" highlight cursor line
autocmd BufWinEnter * set cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" fffffast
set ttyfast
set lazyredraw

" terminal name
set title
set titlestring=%f

" ruler
set ruler
set colorcolumn=80

" line number
set number
set relativenumber

" theme
set list
set listchars=eol:$,tab:\ \
set t_Co=256
syntax on
set synmaxcol=1024
set background=dark
colorscheme base16-atelier-forest

" text nowrap
set nowrap

" tab file completion
set wildmenu
set wildmode=longest:full
set wildignore=*.docx,*.jpg,*.gif,*.pyc,*.o,*.a,*.odt

" menucompletion
set completeopt=menu,menuone,noselect
set completeopt-=preview

" default shell
if filereadable('/bin/zsh')
    set shell=/bin/zsh
endif

" get mouse
if $TERM != 'linux'
    set mouse=a
endif

" search
set nohlsearch
set ignorecase
set smartcase
set showmatch
set incsearch

" tab/space settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom function

" have an 'I' cursor
function! EnterCursorBar()
    exec ':! echo -e -n "\x1b[\x36 q"'
endfunction
command! EnterCursorBar call EnterCursorBar()

" execute normatrix (my Epitech C coding style checker)
" you may update the command if you dont have the same path
function! NorMatrix()
    term ++shell $HOME/.src/NorMatrix/exec.sh
endfunction
command! NorMatrix call NorMatrix()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keybinding

" excute the normatrix function with <F4>
map <F4> :<C-U>NorMatrix<CR>

" save the file with Ctrl+s
nnoremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>

" exit with Ctrl+q
nnoremap <C-q> <Esc>:wq<CR>
inoremap <C-q> <Esc>:wq<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_theme = 'base16'
let g:airline_left_sep = '>'
let g:airline_right_sep = '<'
let g:airline_inactive_collapse = 1
let g:airline_highlighting_cache = 0
let g:airline#parts#ffenc#skip_expected_string ='utf-8[unix]'
let g:airline_stl_path_style = 'full'
let g:airline#extensions#cursormode#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_global_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_semantic_triggers = { 'c': ['->', '.', 're!\w{2}'] }
"let g:ycm_add_preview_to_completeopt = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.o$', '\.a$', '__pycache__$']
let NERDTreeWinSize = 25
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" devicon
if $TERM != 'linux'
    let g:webdevicons_enable_nerdtree = 1
    let g:webdevicons_conceal_nerdtree_brackets = 1
    let g:webdevicons_enable_airline_statusline = 1
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Screensaver
let g:screensaver_password = 1
" not serious password
call screensaver#source#password#set(sha256('vim'))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow
let g:rainbow_active = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mru
let g:MRU_File = $HOME.'/.vim/.vim_mru_files'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open-pdf
" because i dont want another .hidden folder in $HOME
let g:pdf_cache_dir = $HOME.'/.vim/.open-pdf.vim.cache'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-cpp-modern
let g:cpp_function_hightlight = 1
let g:cpp_member_hightlight = 1
let g:cpp_simple_hightlight = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_signs = 1
"let g:syntastic_echo_current_error = 1
"let g:syntastic_c_compiler_options = ' -Wall -Wextra -Wpedantic'
"let g:syntastic_c_include_dirs = [ "lib/include", "include", "../include", "../lib/include"]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_file_size_limit = 10000
let g:tagbar_wrap = 1
let g:tagbar_show_tag_count = 1
let g:tagbar_width = min([30, winwidth(0) / 5])
"autocmd FileType * call tagbar#autoopen(0)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
