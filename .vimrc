call plug#begin('~/.vim/plugged')

" Bare necessities
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'           " Quick surround: ysiW etc.
Plug 'tpope/vim-repeat'             " Use . for plugin command repetition, too
Plug 'tpope/vim-commentary'         " Better comments
Plug 'tpope/vim-unimpaired'         " Bracket mappings ([n, ]n, [c, ]c, etc.)
Plug 'kien/rainbow_parentheses.vim' " Pretty paren
Plug 'neomake/neomake'              " Run make from Vim
Plug 'mhinz/vim-signify'

" Python development
Plug 'python-mode/python-mode'
Plug 'kh3phr3n/python-syntax'        " Better highlighting
Plug 'Vimjas/vim-python-pep8-indent' " Better python indent
Plug 'tmhedberg/SimpylFold'          " Better folding

" Clojure development
Plug 'tpope/vim-salve',     { 'for': 'clojure' } " Lein support
Plug 'tpope/vim-dispatch',  { 'for': 'clojure' } " Run builds, tests, etc. in tmux, screen...
Plug 'tpope/vim-fireplace', { 'for': 'clojure' } " REPL integration
Plug 'guns/vim-sexp',       { 'for': 'clojure' } " Selection and movement for compound forms and elements
                                                 " (vaf selects entire form, vae selects element, vas
                                                 " string etc.), == for indenting the entire form etc.

Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' } " dsb, csb, cse...
Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure' } " More highlighting
Plug 'guns/vim-slamhound',                         { 'for': 'clojure' } " Slamhound namespace mangler integration
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' } " EDN files support

" Haskell development
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' } " indentation and syntax highlight
Plug 'ndmitchell/ghcid', { 'for': 'haskell', 'rtp': 'plugins/nvim' } " IDE support

" Swag
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'       " Pretty icons in NERDtree
Plug 'calebsmith/vim-lambdify'      " -> <bling> defn -> lambda symbol. </bling>

" Additional syntax support
Plug 'pearofducks/ansible-vim'
Plug 'cespare/vim-toml'
Plug 'pboettch/vim-cmake-syntax'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'LnL7/vim-nix'

" Focus writing
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'

call plug#end()

filetype plugin indent on

"""
""" Vim general options start here
"""

" Default encoding
set encoding=utf-8

" Disable mouse
set mouse=""

" Faster rendering (push more characters through to the terminal per cycle)
set ttyfast

" Enable syntax highlighting
syntax on
" Don't highlight long lines
set synmaxcol=256

" Italics start/end
set t_ZH=[3m
set t_ZR=[23m

" Proper tabs (common languages/format)
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
" Visually indent wrapped lines, thus preserving horizontal blocks of text
set breakindent

" Auto-update if changes are detected
set autoread

" Allow switching between dirty buffers without saving contents first
set hidden

" Show the matching part of the pair for [] {} and ()
set showmatch

" Set default split behaviour
set splitbelow
set splitright

" Show line numbers
set number

" Enable relative line numbers
set rnu

" Keep some lines within window when moving
set scrolloff=5

" Highlight matching words and move during search
set hlsearch
set incsearch
" Smarter case-sensitive search
set ignorecase
set smartcase

" Assume s/../../g
set gdefault

" 80-line column
if exists('+colorcolumn')
	set colorcolumn=80
endif

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show a visual line under the cursor's current line (slows down a LOT)
" set cursorline

" Blink cursor on error instead of beeping
set visualbell

" Enable folding
set foldmethod=indent
" Do not fold regions automatically
set foldlevel=99

" Use OS X clipboard
set clipboard=unnamed

" Show leader-key activation
set showcmd

" Always display status line
set laststatus=2

" Dark mode
set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Highlight bad whitespace, folded regions and conceal
highlight BadWhitespace ctermbg=red guibg=red
highlight Folded ctermfg=darkgrey ctermbg=NONE
highlight Conceal ctermfg=58 ctermbg=NONE
" Needed for vim-markdown.
highlight htmlItalic cterm=italic 
highlight htmlBold cterm=bold

" Protect against crash-during-write...
set writebackup
" ... but do not persist backup after successful write
set nobackup

" Use rename-and-write-new method whenever safe
set backupcopy=auto

" Protect changes between writes. Default values of updatecount (200
" keystrokes) and updatetime (4 seconds) are fine
set swapfile

" Persist the undo tree for each file
set undofile

" Patch required to honor double slash at end
if has("patch-8.1.0251")
	" Consolidate the writebackups -- not a big deal either way, since they
    " usually get deleted, swaps and undo trees.
	set backupdir^=~/.vim/backup//
    set directory^=~/.vim/swap//
    set undodir^=~/.vim/undo//
end

" Better diff algorithm
if has("patch-8.1.0360")
	set diffopt+=internal,algorithm:patience
endif

" Better encryption algorithm
if !has("nvim")
    set cryptmethod=blowfish2
endif

"""
""" Vim filetype-specific config starts here
"""

" PEP8 indentation
au BufNewFile,BufRead *.py |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=0 |
    \ set wrapmargin=0 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set textwidth=79

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp,*.java match BadWhitespace /\s\+$/

au Filetype clojure setlocal textwidth=80
au Filetype c,h,cpp,hpp,java setlocal tabstop=4 shiftwidth=4 expandtab
au Filetype yaml setlocal tabstop=2 shiftwidth=2 expandtab
au Filetype xml setlocal autoindent tabstop=4 shiftwidth=4 noexpandtab
au Filetype sql setlocal tabstop=4 shiftwidth=4 expandtab
au Filetype markdown,md,txt,text,asciidoc setlocal textwidth=79 foldenable autoindent
au Filetype markdown setlocal conceallevel=2
" Ensure tabs don't get converted to spaces in Makefiles.
au FileType make setlocal noexpandtab
" Make sure all types of requirements.txt files get syntax highlighting.
au BufNewFile,BufRead requirements*.txt set syntax=python

" Unset paste on InsertLeave.
au InsertLeave * silent! set nopaste

"""
""" Vim keybindings config starts here
"""

" More convenient exit from normal mode
inoremap jk <ESC>

" Unmap space from default <right>, map it to leader instead (ignore select
" mode)
nnoremap <SPACE> <Nop>
map <SPACE> <Leader>
sunmap <Space>

" Sane movement through wrapping lines
noremap j gj
noremap k gk
" Prevent x from overriding what's in the clipboard.
" (_ is the black-hole register, vim's equivalent of /dev/null)
noremap x "_x
noremap X "_x

" Cycle splits
nnoremap <S-Tab> <C-w>w

" Toggle paste mode
set pastetoggle=<F9>

" Don't go to Ex mode, or edit command-line history
map q: <Nop>
map Q <Nop>

" Skip quickfix buffer when moving through buffers.
function! BSkipQuickFix(command)
  let start_buffer = bufnr('%')
  execute a:command
  while &buftype ==# 'quickfix' && bufnr('%') != start_buffer
    execute a:command
  endwhile
endfunction

" To open a new empty buffer
nmap <Leader>t :enew<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <Leader>q :call BSkipQuickFix("bp") <BAR> bd #<CR>

" Move to the next buffer
nmap <Leader>] :call BSkipQuickFix("bn")<CR>

" Move to the previous buffer
nmap <Leader>[ :call BSkipQuickFix("bp")<CR>

" Use arrows for resizing
nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Use . for each line of visual block
vnoremap . :normal .<CR>

" Toggle folding with space comma
nnoremap <leader>, za

" Auto-reload Clojure source within REPL
au Filetype clojure nmap <C-c><C-k> :Require<cr>

" NERDTree shortcut
map <C-k> :NERDTreeToggle<CR>
map <C-a> :NERDTreeFind<CR>

" Shortcuts for 3-way merge
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>

" Shorter reformat in paragraph
nnoremap <leader>f gqip

"""
""" Vim plugins config starts here
"""

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_tomorrow'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](target|\.(git|hg|svn|venv)|__pycache__)$' }

" RainbowParen
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

" NERDTree
let NERDTreeMapActivateNode='<space>'
let g:NERDTreeNodeDelimiter = "\u00a0"
" Open NERDTree automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_python_checkers=['flake8']

" SimpylFold
" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Pymode
let python_highlight_all = 1
" Let syntastic do all linting
let g:pymode_lint = 0
let g:pymode_python = 'python3'
let g:pymode_rope = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_regenerate_on_write = 0

" Goyo
let g:goyo_width = 100

" Auto-enable Limelight in Goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    " silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set scl=no
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    " silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  set scl=yes
  SignifyEnable
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Split keybinding
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-R> <C-W><C-H>

" YCM stuff
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" CamelCaseMotion mappings
" call camelcasemotion#CreateMotionMappings('<leader>')

" Tagbar toggle
" nmap <F8> :TagbarToggle<CR>

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

" Map a few common things to do with FZF.
nnoremap <silent> <C-p> :call FZFOpen(':FZF -m')<CR>
nnoremap <silent> <Leader>p :call FZFOpen(':Buffers')<CR>
nnoremap <silent> <C-s>b :call FZFOpen(':BLines')<CR>
nnoremap <silent> <C-s>l :call FZFOpen(':Lines')<CR>

set completeopt=menuone,noinsert

" Markdown
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_frontmatter = 1

let g:mkdp_open_to_the_world = 1
let g:mkdp_port = '8894'
let g:mkdp_preview_options = {
    \ 'disable_sync_scroll': 1,
    \ }


" VimWiki
let g:vimwiki_list = [{'path': '~/git/journal/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
