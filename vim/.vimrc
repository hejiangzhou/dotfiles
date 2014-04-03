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

Plugin 'The-NERD-tree'
map <F8> :NERDTreeToggle<cr>

Plugin 'ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn\|\.git5_specs$\|review$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'blaze-bin\|blaze-genfiles\|blaze-google3\|blaze-out\|blaze-testlogs\|READONLY$',
  \ }

Plugin 'The-NERD-Commenter'
let NERDSpaceDelims = 1

Plugin 'bufexplorer.zip'
Plugin 'fugitive.vim'
Plugin 'https://github.com/rosenfeld/conque-term.git'
" Open Bash with ConqueTerm
nnoremap ,ba :call CurDirOpenConque('/bin/bash') <CR>
" Open the Python interpreter
nnoremap ,bp :call CurDirOpenConque('python') <CR>

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
let g:session_autosave = 'no'

" requred by Vundle
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/dotfiles/vim/general.vim


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

if filereadable(expand('~/dotfiles/vim/.vimrc.local'))
    source ~/dotfiles/vim/.vimrc.local
endif
