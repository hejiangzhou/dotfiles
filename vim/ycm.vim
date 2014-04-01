Plugin 'Valloric/YouCompleteMe'

nnoremap <C-y>g :YcmCompleter GoTo<CR>
nnoremap <C-y>d :YcmCompleter GoToDeclaration<CR>
nnoremap <C-y>f :YcmCompleter GoToDefinition<CR>

let g:ycm_confirm_extra_conf = 0
