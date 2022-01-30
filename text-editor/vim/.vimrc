" VIMRC
" settings for vim

" say that the color syntax could be better in tmux in tty
if $TERM == 'linux'
	echo "you could have better syntax/color in tmux"
endif

" set mouse for alacritty
if $TERM == 'alacritty'
	set ttymouse=sgr
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim plug
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/ZoomWin'
Plug 'skywind3000/vim-terminal-help'

Plug 'Heliferepo/VimTek'
Plug 'vim-scripts/DoxygenToolkit.vim'

Plug 'itchyny/vim-cursorword'

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

Plug 'itchyny/screensaver.vim'

Plug 'rhysd/open-pdf.vim'

Plug 'ycm-core/YouCompleteMe'

Plug 'luochen1990/rainbow'
Plug 'bfrg/vim-cpp-modern'
Plug 'ntpeters/vim-better-whitespace'

" Plug 'scrooloose/syntastic'
" Plug 'tpope/vim-fugitive'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" highlight cursor line
set cursorline

"
set ttyfast

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
set t_Co=256
syntax on
set synmaxcol=1024
set background=dark
colorscheme iceberg

" text nowrap
set nowrap

" tab file completion
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.gif,*.pyc,*.o,*.a,*.odt

" menucompletion
set completeopt=menu,menuone,noselect
set completeopt-=preview

" default shell
set shell=/bin/zsh

" get mouse
set mouse=a

" search
set hlsearch
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

" execute normatrix
function! NorMatrix()
	term ++shell=$HOME/.src/NorMatrix/exec.sh
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_theme = 'badwolf'
let g:airline_left_sep = '>'
let g:airline_right_sep = '<'
let g:airline_inactive_collapse = 1
let g:airline_highlighting_cache = 0
let g:airline#parts#ffenc#skip_expected_string ='utf-8[unix]'
let g:airline_stl_path_style = 'short'
let g:airline#extensions#cursormode#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_global_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
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
" Screensaver
let g:screensaver_password = 1
" not serious password
call screensaver#source#password#set(sha256('vim'))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-rainbow / rainbow
let g:rainbow_active = 1
" au FileType c,cpp,python,rust call rainbow#load()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open-pdf
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
