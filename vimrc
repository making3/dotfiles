""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  By: Matt King
" 
" Thanks to:
"       Amir Salihefendic (his vimrc)
"  
" References: 
"       http://amix.dk/vim/vimrc.html
"
" Sections:
"       General
"       UI
"       Colors and fonts
"       Text, tabs and indents
"       Moving around, tabs, windows and buffers
"       Status line (unused)
"       Fold settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable pathogen
execute pathogen#infect()

filetype plugin on

" Used as a leader key for extra key combos
let mapleader = ","

" Fast saving
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

" Turn off highlighting
nmap <F3> :noh<CR>

" Tabular mappings
nmap <leader>a= :Tab /=<cr>
vmap <leader>a= :Tab /=<cr>
nmap <leader>a: :Tab /:\zs<cr>
vmap <leader>a: :Tab /:\zs<cr>


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set ffs=unix,dos,mac

"se t_Co=16
"set background=dark
"let g:solarized_termcolors=256
"let g:solorized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termtrans = 1
"colorscheme solarized


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indents
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Set tab widths to 4 
set shiftwidth=4
set tabstop=4
set softtabstop=4

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

" Enable syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.template set filetype=html
au BufNewFile,BufRead *.mustache set filetype=html

" Turns on yanking/cutting to the clipboard.
"set clipboard+=unnamedplus 

" Disable arrow keys.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
"set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


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
