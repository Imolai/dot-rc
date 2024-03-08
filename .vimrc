" Gabor Imolai's vimrc, https://raw.githubusercontent.com/Imolai/dot-vimrc/main/.vimrc

" INITIALIZATION
syntax enable
filetype plugin on
let g:polyglot_disabled = ['autoindent']

" PLUGins
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
call plug#end()

" SETTINGS
"set background=dark
set autoindent
set backspace=2
set nobackup
set clipboard=unnamed
set colorcolumn=+1
set expandtab
set foldlevel=99
set foldmethod=indent
set hidden
set hlsearch
set incsearch
set list
set mouse=a
set number
set relativenumber
set ruler
set shiftround
set shiftwidth=4
set showmatch
set showmode
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set noswapfile
set tabstop=4
set textwidth=100
set nowritebackup
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

" END
