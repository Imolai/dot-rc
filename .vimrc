" begin Gabor Imolai's vimrc, https://raw.githubusercontent.com/Imolai/dot-vimrc/main/.vimrc

" 0 Initialization
syntax enable
filetype plugin indent on

" 1 Plugins
"
" Plug installation:
let g:plug_installed = 1
if empty(glob('~/.vim/autoload/plug.vim'))
  let g:plug_installed = 0
  echo "vim-plug is not installed. Installing..."
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  if filereadable('~/.vim/autoload/plug.vim')
    execute 'source ~/.vim/autoload/plug.vim'
  else
    echo "Error: vim-plug installation failed."
    quit
  endif
endif
"
call plug#begin()
Plug 'scrooloose/nerdtree'
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
Plug 'puremourning/vimspector'
Plug 'morhetz/gruvbox'
call plug#end()
" Automatic PlugInstall, after recent installation of vim-plug
if g:plug_installed == 0
  echo "Running :PlugInstall to install plugins..."
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" 2 Essential settings
set number
set relativenumber
set cursorline
set colorcolumn=+1
if has('termguicolors')
  set termguicolors
endif
set clipboard=unnamed
set encoding=utf-8
scriptencoding utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set copyindent
set preserveindent
set backspace=2
set splitbelow
set splitright
set incsearch
set hlsearch
set list
"set listchars=tab:>-,space:˙,eol:$
set numberwidth=5
set nohidden
set title
set titleold=bash
set mouse=a
set printoptions=paper:A4
set showcmd
set ruler
set undolevels=99999
set textwidth=79
set showmatch
set matchpairs=(:),{:},[:],<:>
set smarttab
set shiftround
set foldlevel=99
set foldmethod=indent
set nobackup
set nowritebackup
set noswapfile

" 3 Plugin settings
" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
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
" Color scheme
colorscheme gruvbox
set background=dark

" 4 Keyboard shortcuts
" Leader key is space
let mapleader = " "
" ALE keys
nnoremap <leader>al :ALELint<CR>
nnoremap <leader>an :ALENext<CR>
nnoremap <leader>ap :ALEPrevious<CR>
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>aw :ALEDetail<CR>
" NERDTree and Tagbar
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>tb :TagbarToggle<CR>
" Terminal
nnoremap <leader>tt :below terminal<CR>
" Debugger (Vimspector)
nnoremap <leader>db :VimspectorLaunch<CR>
nnoremap <leader>ds :VimspectorStepInto<CR>
nnoremap <leader>do :VimspectorStepOut<CR>
nnoremap <leader>dn :VimspectorStepOver<CR>
nnoremap <leader>de :VimspectorReset<CR>
nnoremap <leader>dt :VimspectorToggleBreakpoint<CR>
" Syntax highlights
nnoremap <leader>ss :syntax enable<CR>
nnoremap <leader>sn :syntax off<CR>
" Remove search highlight
nnoremap <leader>cc :nohlsearch<CR>

" end
