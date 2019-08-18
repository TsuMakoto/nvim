if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " set toml-path
  let s:toml_dir = expand('~/.dotfiles/vim/rc/toml') 
 
  if !has('nvim')
    " nvimプラグイン用
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')

    " for vim8
    " 補完
    " call dein#add('Shougo/neosnippet-snippets')
    " call dein#add('Shougo/neocomplete.vim')
    " let g:neocomplete#enable_at_startup = 1
  endif

  " load deoplete
  call dein#load_toml(s:toml_dir . '/dein_deoplete.toml', {'lazy': 0})
  " load toml files
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  " プログラミング言語用toml load
  call dein#load_toml(s:toml_dir . '/dein_lang.toml', {'lazy': 0})
  " lazy load toml files
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
	
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
