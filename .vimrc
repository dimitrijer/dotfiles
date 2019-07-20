set nocompatible              " required

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle " instead of Plugin)
"
" Bare necessities
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'

" Python development
Plugin 'python-mode/python-mode'
Plugin 'kh3phr3n/python-syntax'        " Better highlighting
Plugin 'Vimjas/vim-python-pep8-indent' " Better python indent
Plugin 'tmhedberg/SimpylFold'          " Better folding

" Clojure development
Plugin 'tpope/vim-salve'              " Lein support
Plugin 'tpope/vim-dispatch'           " Run builds, tests, etc. in tmux, screen...
Plugin 'tpope/vim-fireplace'          " REPL integration
Plugin 'tpope/vim-surround'           " Quick surround: ysiW etc.
Plugin 'tpope/vim-repeat'             " Use . for plugin command repetition, too
Plugin 'guns/vim-sexp'                " Selection and movement for compound forms and elements
                                      " (vaf selects entire form, vae selects element, vas
                                      " string etc.), == for indenting the entire form etc.
Plugin 'tpope/vim-sexp-mappings-for-regular-people' " dsb, csb, cse{ ...
Plugin 'kien/rainbow_parentheses.vim' " Pretty paren
Plugin 'guns/vim-clojure-highlight'   " More highlighting
Plugin 'guns/vim-slamhound'           " Slamhound namespace mangler integration
Plugin 'guns/vim-clojure-static'      " EDN files support

" Swag
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'       " Pretty icons in NERDtree
Plugin 'calebsmith/vim-lambdify'      " -> <bling> defn -> lambda symbol. </bling>

" Syntax support
Plugin 'pearofducks/ansible-vim'      " Ansible YAML
Plugin 'cespare/vim-toml'             " TOML for poetry
Plugin 'pboettch/vim-cmake-syntax'    " CMake


" Unused
" Plugin 'majutsushi/tagbar'      " Right side code markers (methods, vars, ...)
" Plugin 'Valloric/YouCompleteMe' " Code-completion with shitload of required plugins
" Plugin 'godlygeek/tabular'      " Aligning table-like text
" Plugin 'jdonaldson/vaxe'        " Haxe plugin
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:airline_theme = 'base16_tomorrow'

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

" Python3 highlighting
let g:pymode_python = 'python3'

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

" To open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>n :bnext<CR>

" Move to the previous buffer
nmap <leader>p :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" proper tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" show line numbers
set number

" show a visual line under the cursor's current line
" slows down a LOT
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Set default split behaviour
set splitbelow
set splitright

" Keep some lines within window when moving.
set scrolloff=5

" Highlight matching words and move during search.
set hlsearch
set incsearch
" Smarter case-sensitive search
set ignorecase
set smartcase

" Split keybinding
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-R> <C-W><C-H>

" Arrows for resizing
nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Enable folding
" set foldmethod=indent
" Do not fold regions automatically
set foldlevel=99

" 80-line column.
if exists('+colorcolumn')
	set colorcolumn=80
endif

" YCM stuff.
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" CamelCaseMotion mappings
" call camelcasemotion#CreateMotionMappings('<leader>')

" CtrlP exclude list.
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](target|\.(git|hg|svn|venv)|__pycache__)$' }

" CtrlP tags search
nnoremap <leader>. :CtrlPTag<cr>

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
let g:NERDTreeNodeDelimiter = "\u00a0"

" Tagbar toggle
" nmap <F8> :TagbarToggle<CR>

" Open NERDTree automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use Mac OS clipboard.
set clipboard=unnamed
" Show leader-key activation.
set showcmd

" Syntastic default config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_python_checkers=['flake8']

" Let syntastic do all linting.
let g:pymode_lint = 0

let python_highlight_all = 1

" Toggle folding with space comma
nnoremap <leader>, za

" Faster rendering
set ttyfast

" Toggle paste mode
set pastetoggle=<F9>

" Blink cursor on error instead of beeping
set visualbell

nnoremap <leader>f gqip

" shortcuts for 3-way merge
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>
if has("patch-8.1.0360")
	set diffopt+=internal,algorithm:patience
endif

set mouse=n

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//
