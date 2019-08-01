ctrlp-goimport
==============

ctrlp-goimport provides a Go packages incremental search and import in ctrlp.vim.

Requirement
-----------

-	[ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
-	[vim-go](https://github.com/fatih/vim-go)
-	[gopkgs](https://github.com/uudashr/gopkgs)

Installation
------------

```console
go get -u github.com/uudashr/gopkgs/cmd/gopkgs
```

### vim-plug

```vim
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', {'for': 'go'}

Plug 'nametake/ctrlp-goimport', {'for': 'go'}
```

Key Mapping
-----------

```vim
nmap <C-g><C-i> <Plug>(ctrlp-goimport)
```

Usage
-----

Run: `CtrlPGoimport` or type the mapped command to invoke ctrlp-goimport.
