scriptencoding utf-8

if exists('g:loaded_hellobeautifulworld')
    finish
endif
let g:loaded_ultisnipsgoiferr = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

" TODO

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
