if !g:at_google
    Plugin 'Valloric/YouCompleteMe'
endif

nnoremap <C-y>g :YcmCompleter GoTo<CR>
nnoremap <C-y>d :YcmCompleter GoToDeclaration<CR>
nnoremap <C-y>f :YcmCompleter GoToDefinition<CR>
nnoremap <C-y>r :YcmForceCompileAndDiagnostics<CR>
nnoremap <C-y>R :YcmRestartServer<CR>

let g:ycm_confirm_extra_conf = 0
