"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

let g:at_google = filereadable(expand('~/.at-google'))
let g:vimconfig_dir = expand('~/dotfiles/vim')

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle plugins
Plugin 'gmarik/vundle'

" requred by Vundle
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/dotfiles/vim/general.vim

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

for f in split(glob('~/dotfiles/vim/mods.enabled/*.vim'), '\n')
    exe 'source' f
endfor

if filereadable(expand('~/dotfiles/.vimrc.local'))
    source ~/dotfiles/.vimrc.local
endif
