""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  By: Matt King
" 
" Thanks to:
"       Amir Salihefendic (his vimrc)
"  
" References: 
"       http://amix.dk/vim/vimrc.html
"
" This is settings specifically for gvim with the 
" 	included vimrc.
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hide toolbars in gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar

" Set Control+W to tmux settings
nmap <C-A> <C-W>
nmap <C-A>% <C-W>v
nmap <C-A>" <C-W>s

" Allows "windows functionality" to work (such as Control+C and Control+P)
source $VIMRUNTIME/mswin.vim

" Forgot what these do...
set nocompatible
source $VIMRUNTIME/vimrc_example.vim

syntax enable
set background=dark
colorscheme solarized

" Change to dev directory by default
if hostname() == 'IWTDEV13'
    :cd C:\dev
elseif hostname() == 'HOME'
endif
