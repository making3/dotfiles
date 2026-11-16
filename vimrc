""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap and backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""

set swapfile
set dir=~/.vim/.swap
set backupdir=~/.vim/.backups

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
syntax on

" Used as a leader key for extra key combos
let mapleader = ","

" Fast saving
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

" Turn off highlighting
nmap <F3> :noh<CR>

" MApping + and - to increment/decrement
nnoremap <kPlus> <C-a>
nnoremap <kMinus> <C-x>

" Better command-line completion
set wildmenu

" Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor
set so=7

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Is smart when searching with cases.
set smartcase

" Highlight search results
set hlsearch

" Searches as you type
set incsearch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" A buffer becomes hidden when it is abandoned
set hid

" Show matching brackets when text indicator is over them
set showmatch

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding and file formats
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indents
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Set tab widths to 2 
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Auto indent
set ai

" Smart indent
set si

" Line numbers
set nu

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Easy buffer commands
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>
map <leader>bb :ls<cr>:buffer<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold settings (equivalant to collapsing)
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax
set foldlevelstart=99
set foldnestmax=5

" Fold colors (to make it appear like dashes and 
" not have a horrible background color).
:hi Folded ctermfg=216
:hi Folded ctermbg=255

" Enables folding for javascript syntax.
let javaScript_fold=1
let ruby_fold=1
let vimsyn_folding='af'
let xml_syntax_folding=1
let sh_fold_enabled=1

" Easy top level folding
map <leader>f :%foldc<cr>
map <leader>o zR<cr>
map <leader>r :setlocal foldlevel=1<cr>
