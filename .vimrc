" Gabor Imolai's vimrc, https://raw.githubusercontent.com/Imolai/dot-vimrc/main/.vimrc


"  0 initialization
syntax enable
filetype plugin on
let g:polyglot_disabled = ['autoindent']
"  0 plugins
"
" installation:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-scripts/awk-support.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'stephpy/vim-yaml'
call plug#end()


"  1 important
"set nocompatible  " default setting from Vim 8.0
set nopaste


"  2 moving around, searching and patterns
set incsearch


"  3 tags


"  4 displaying text
set list
set listchars=tab:>-,space:˙,eol:$
set number
"set relativenumber
set numberwidth=5


"  5 syntax, highlighting and spelling
"set background=dark
set hlsearch
"set cursorcolumn
set cursorline
set colorcolumn=+1


"  6 multiple windows
set nohidden
set splitbelow
set splitright


"  7 multiple tab pages


"  8 terminal
set title
set titleold=bash


"  9 using the mouse
set mouse=a


" 10 printing
set printoptions=paper:A4


" 11 messages and info
set showcmd
"set showmode  " instead, vim-airline
set ruler


" 12 selecting text


" 13 editing text
set undolevels=99999
set textwidth=100
set backspace=2
set showmatch
set matchpairs=(:),{:},[:],<:>


" 14 tabs and indenting
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent
set copyindent
set preserveindent


" 15 folding
set foldlevel=99
set foldmethod=indent


" 16 diff mode


" 17 mapping


" 18 reading and writing files
set nobackup
set nowritebackup


" 19 the swap file
set noswapfile


" 20 command line editing


" 21 executing external commands


" 22 running make and jumping to errors (quickfix)


" 23 language specific


" 24 multi-byte characters
set encoding=utf-8


" 25 various


" 26 misc
scriptencoding utf-8
set clipboard=unnamed
" NERDTree
nmap <F7> :NERDTreeToggle<CR>
" Tagbar
nmap <F8> :TagbarToggle<CR>
" ALE
let g:ale_linters = {'python': ['pylint', 'pycodestyle', 'pydocstyle'], 'perl': ['perl', 'perlcritic'], 'shell': ['shell', 'shellcheck']}
let g:ale_fixers = {'python': ['black', 'isort'], 'perl': ['perltidy'], 'shell': ['shfmt']}
let g:ale_python_pylint_options = '--rcfile $HOME/.pylintrc'
let g:ale_python_pycodestyle_options = '--config $HOME/setup.cfg'
let g:ale_python_pydocstyle_options = '--config $HOME/setup.cfg'
let g:ale_python_black_options = '-t py39 -l 100'
let g:ale_perl_perlcritic_options = '--brutal'
let g:ale_sh_shellcheck_options = '-x -e SC1117'
let g:shfmt_extra_args = '-i 100 -ci'
let g:ale_sign_error = 'EE'
let g:ale_sign_warning = 'WW'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] (%code%) %s [%severity%]'
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 0
let g:ale_fix_on_insert_leave = 0


" end
