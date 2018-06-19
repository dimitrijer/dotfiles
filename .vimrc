set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle " instead of Plugin)
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree.git'
Bundle 'chase/vim-ansible-yaml'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
" Plugin 'tomasr/molokai'
Plugin 'godlygeek/tabular'
" Haxe plugin
Plugin 'jdonaldson/vaxe'
" Clojure dev plugins
" -> Leiningen support
Plugin 'tpope/vim-salve'
" -> Used for dispatching to lein
Plugin 'tpope/vim-dispatch'
" -> Magic Clojure support
Plugin 'tpope/vim-fireplace'
" -> Quick surround: ysiW etc.
Plugin 'tpope/vim-surround'
" -> For using . for plugin command repeating as well.
Plugin 'tpope/vim-repeat'
" -> Selection and movement for compound forms and elements (vaf selects entire
"  form, vae selects element, vas string etc.), == for indenting the entire
"  form etc.
Plugin 'guns/vim-sexp'
" -> Self-explanatory, contains some mappings for vim-surround as well (dsb,
"  csb, cse{ etc.)
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
" -> Pretty paren.
Plugin 'kien/rainbow_parentheses.vim'
" -> Extended syntax highlighting.
Plugin 'guns/vim-clojure-highlight'
" -> <bling> defn -> lambda symbol. </bling>
Plugin 'calebsmith/vim-lambdify'
" -> Even though it's shipped with Vim, I'm adding this because of EDN files.
Plugin 'guns/vim-clojure-static'
Plugin 'flazz/vim-colorschemes'
Plugin 'guns/vim-slamhound'
Plugin 'pearofducks/ansible-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set background=dark
colorscheme gruvbox

" Unmap space from default <right>, map it to leader instead (ignore select
" mode).
nnoremap <SPACE> <Nop>
map <SPACE> <Leader>
sunmap <Space>

" Allow switching between dirty buffers without saving contents first.
set hidden

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
autocmd BufNewFile,BufRead *.py |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=0 |
    \ set wrapmargin=0 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set textwidth=79

" Mark bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

highlight Conceal ctermfg=58 ctermbg=NONE

"Stuff
syntax on
inoremap jk <ESC>
set encoding=utf-8
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" proper tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

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

" Arrows for resizing
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" 80-line column.
if exists('+colorcolumn')
	set colorcolumn=80
endif

" Enable folding with the comma
nnoremap "," za

" YCM stuff.
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" CamelCaseMotion mappings
" call camelcasemotion#CreateMotionMappings('<leader>')

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
au Filetype clojure setlocal textwidth=80

au Filetype java setlocal tabstop=4 shiftwidth=4 expandtab

" Keep some lines within window when moving.
set scrolloff=5

" Set tabbing in SQL files.
au Filetype sql setlocal tabstop=4 shiftwidth=4 expandtab
au Filetype cpp setlocal tabstop=4 shiftwidth=4 expandtab
au Filetype c setlocal tabstop=4 shiftwidth=4 expandtab
au Filetype yaml setlocal tabstop=2 shiftwidth=2 expandtab
au Filetype xml setlocal autoindent tabstop=4 shiftwidth=4 noexpandtab

au Filetype markdown setlocal textwidth=79
au Filetype asciidoc setlocal textwidth=79

" Use . for each line of visual block
vnoremap . :normal .<CR>

" NERDTree shortcut
map <C-k> :NERDTreeToggle<CR>
map <C-a> :NERDTreeFind<CR>
let NERDTreeMapActivateNode='<space>'

" Open NERDTree automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use Mac OS clipboard.
set clipboard=unnamed
" Show leader-key activation.
set showcmd

" Highlight matching words and move during search.
set hlsearch
set incsearch
