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
"		OS Specific
"       General
"       UI
"       Plugins
"       Colors and fonts
"       Text, tabs and indents
"       Moving around, tabs, windows and buffers
"       Fold settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OS Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""

set swapfile
  
if has("win32") || has("win16")
  set dir=$HOME\.vim\.swap\
  set backupdir=$HOME\.vim\.backups\

  " Change default vimfiles location
  set runtimepath+=~/.vim

  " Change default font (whatever solarized uses sucks)
  set guifont=Consolas:h10:cANSI
else
  set dir=~/.vim/.swap
  set backupdir=~/.vim/.backups
endif

:let g:notes_directories = ['~/Dropbox/notes', '~/notes']

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on

" Used as a leader key for extra key combos
let mapleader = ","

" Fast saving
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>t :NERDTree<cr>

" Turn off highlighting
nmap <F3> :noh<CR>

" MApping + and - to increment/decrement
nnoremap <kPlus> <C-a>
nnoremap <kMinus> <C-x>

" Better VIM autocompletion
set wildmenu
set laststatus=2

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable pathogen
execute pathogen#infect()

" Tabular mappings
if (exists(":Tabularize"))
  nmap <leader>a= :Tab /=<cr>
  vmap <leader>a= :Tab /=<cr>
  nmap <leader>a: :Tab /:\zs<cr>
  vmap <leader>a: :Tab /:\zs<cr>
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic & ESLint Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://stackoverflow.com/a/34169645/724591
noremap <leader>es<cr> :w<cr> :SyntasticCheck<cr>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_eq = 0
let g:syntastic_javascript_checkers = [ 'eslint' ]

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
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set ffs=unix,dos,mac

" Uses solarize for color

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

" Easy buffer commands
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>
map <leader>bb :ls<cr>:buffer<space>
map <leader>a :badd

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
