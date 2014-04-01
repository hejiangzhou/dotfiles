"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle plugins
Plugin 'gmarik/vundle'
source ~/.vim/rc-module/ycm.vim


" requred by Vundle
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/rc-module/general.vim
" source ~/.vim/rc-module/cscope.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F8> :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latexsuite settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1

