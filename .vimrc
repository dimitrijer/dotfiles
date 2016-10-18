set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
" Plugin 'Valloric/YouCompleteMe'
Bundle 'chase/vim-ansible-yaml'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
" Plugin 'tomasr/molokai'
Plugin 'godlygeek/tabular'
" Clojure dev plugins
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'bkad/CamelCaseMotion'
" Even though it's shipped with Vim, I'm adding this because of EDN files.
Plugin 'guns/vim-clojure-static'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme gruvbox
set background=dark

" Use patched fonts for airline
let g:airline_powerline_fonts = 1
" Make airline show before the first split (i.e. all the time)
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" PEP8 indentation
autocmd BufNewFile,BufRead *.py
    \ set tabstop=4
autocmd BufNewFile,BufRead *.py
    \ set softtabstop=4
autocmd BufNewFile,BufRead *.py
    \ set shiftwidth=4
autocmd BufNewFile,BufRead *.py
    \ set textwidth=0
autocmd BufNewFile,BufRead *.py
    \ set wrapmargin=0
autocmd BufNewFile,BufRead *.py
    \ set expandtab
autocmd BufNewFile,BufRead *.py
    \ set autoindent
autocmd BufNewFile,BufRead *.py
    \ set fileformat=unix

" Mark bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Stuff
syntax on
inoremap jk <ESC>
let mapleader = "\<Space>"
set encoding=utf-8
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show line numbers
set number

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Set default split behaviour
set splitbelow
set splitright

" Split keybinding
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-R> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" 80-line column.
if exists('+colorcolumn')
	set colorcolumn=80
endif

" Enable folding with the spacebar
nnoremap <space> za

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" CamelCaseMotion mappings
call camelcasemotion#CreateMotionMappings('<leader>')

" CtrlP exclude list.
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](target|\.(git|hg|svn))$' }

" Always enable rainbow parenthesis.
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['white',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Auto-reload Clojure source within REPL.
au Filetype clojure nmap <C-c><C-k> :Require<cr>

" Keep some lines within window when moving.
set scrolloff=5

" Set tabbing in SQL files.
au Filetype sql setlocal tabstop=4 shiftwidth=4 expandtab

" All right, chums, let's do this. Leeerooooy...
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Use Mac OS clipboard.
set clipboard=unnamed

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
