scriptencoding utf-8

let s:save_cpoptions = &cpoptions
set cpoptions&vim

call add(g:ctrlp_ext_vars, {
      \   'init':   'ctrlp#goimport#init()',
      \   'accept': 'ctrlp#goimport#accept',
      \   'lname':  'goimport',
      \   'sname':  'gi',
      \   'type':   'path',
      \   'sort':   1,
      \ })

function! ctrlp#goimport#init()
  let cmd=get(g:, "ctrlp_goimport_command", "go list all")
  return split(system(cmd), "\n")
endfunction

function! ctrlp#goimport#accept(mode, str)
  call ctrlp#exit()

  let l:has_error=0

  try
    call go#import#SwitchImport(1, '', a:str, '')
    return
  catch
    let l:has_error=1
  endtry

  try
    call gopher#import#do(a:str)
    return
  catch
    let l:has_error=1
  endtry

  if l:has_error
    echoerr 'Please install vim-go or gopher.vim'
  endif
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#goimport#id()
	return s:id
endfunction

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
