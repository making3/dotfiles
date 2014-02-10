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

" Dark color in gVim
colors slate

" Change to C:\dev by default
" :cd C:\dev

" Allows "windows functionality" to work (such as Control+C and Control+P)
source $VIMRUNTIME/mswin.vim

" Forgot what these do...
set nocompatible
source $VIMRUNTIME/vimrc_example.vim

" Sets to default location
set viminfo+=nC:\util\viminfo