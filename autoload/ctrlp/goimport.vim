scriptencoding utf-8

if exists('g:loaded_ctrlpgoimport')
    finish
endif
let g:loaded_ctrlpgoimport = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

call add(g:ctrlp_ext_vars, {
      \   'init':   'ctrlp#goimport#init()',
      \   'accept': 'ctrlp#goimport#accept',
      \   'lname':  'goimport',
      \   'sname':  'gi',
      \   'type':   'line',
      \   'sort':   0,
      \ })

function! ctrlp#goimport#init()
  if !executable('gopkgs')
    echohl 'Please install gopkgs'
  endif
  return split(system('gopkgs --no-vendor'), "\n")
endfunction

function! ctrlp#goimport#accept(mode, str)
  call ctrlp#exit()
  echom a:str
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#goimport#id()
	return s:id
endfunction

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
