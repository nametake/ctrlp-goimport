scriptencoding utf-8

if exists('g:loaded_ctrlpgoimport')
    finish
endif
let g:loaded_ctrlpgoimport = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

command! CtrlPGoimport call ctrlp#init(ctrlp#goimport#id())

nnoremap <silent> <Plug>(ctrlp-goimport) :<C-u>call ctrlp#init(ctrlp#goimport#id())<CR>

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
