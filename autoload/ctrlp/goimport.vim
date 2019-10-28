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
  let cmd=get(g:, "ctrlp_goimports_pkg_list_command", "go list all")
  if !executable(cmd)
    echohl 'Please install ' . cmd
  endif
  return split(system(cmd), "\n")
endfunction

function! ctrlp#goimport#accept(mode, str)
  call ctrlp#exit()
  call go#import#SwitchImport(1, '', a:str, '')
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#goimport#id()
	return s:id
endfunction

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
