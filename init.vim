" ---------------------------------------------------------------- variable
let g:pyenv_root = $HOME . '/.pyenv'
let g:rbenv_root = $HOME . '/.rbenv'
let g:cache = $HOME . '/.cache'
let g:dein_cache = g:cache . '/dein'
let g:repos = g:dein_cache . '/repos/github.com'
let g:dein_git = 'https://github.com/Shougo/dein.vim'
let g:config_dir = $HOME . '/.config/nvim'

" ---------------------------------------------------------------- initialized
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamed
set clipboard=unnamedplus
set foldmethod=marker
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1

" ---------------------------------------------------------------- mapping
" Release keymappings for plug-in.
nnoremap j gj
nnoremap k gk

" Edit init.vim
nnoremap <Space>ev :tabnew ~/.config/nvim/init.vim<CR>
" Reload init.vim
nnoremap <Space>rv :source ~/.config/nvim/init.vim<CR>
" Open vim config-dir
nnoremap <Space>rd :NERDTreeToggle ~/.config/nvim<CR>

" new tab
nnoremap <Space>tn :tabnew<CR>

" resize tab
nnoremap <C-w>; <C-w>+

" Skip move
nnoremap H ^
noremap L $
xnoremap H ^
xnoremap L $

" escape terminal mode
tnoremap <C-[> <C-\><C-n>

" search off
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

" move display
nnoremap <Left>  <C-w>h
nnoremap <Down>  <C-w>j
nnoremap <Up>    <C-w>k
nnoremap <Right> <C-w>l
nnoremap <S-Left>  <C-w>H
nnoremap <S-Down>  <C-w>J
nnoremap <S-Up>    <C-w>K
nnoremap <S-Right> <C-w>L

" ---------------------------------------------------------------- rcファイル読み込み
" function! s:source_rc(rc_file_name)
"   let rc_file = expand(g:g:config_dir . '/rc' . a:rc_file_name)
"   if filereadable(rc_file)
"     execute 'source' rc_file
"   endif
" endfunction

" ---------------------------------------------------------------- load python
if isdirectory(g:pyenv_root)
  let g:python_host_prog = g:pyenv_root . '/versions/2.7.16/bin/python'
  let g:python3_host_prog = g:pyenv_root . '/versions/3.7.3/bin/python'
endif

" ---------------------------------------------------------------- load ruby
if isdirectory(g:pyenv_root)
  let g:ruby_host_prog = g:rbenv_root . '/shims/ruby'
endif

" ---------------------------------------------------------------- load dein.
if !isdirectory(expand(g:cache))
  call mkdir(expand(g:cache), 'p')
endif

let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand(g:dein_cache) . '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone' g:dein_git s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
              \fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

" ---------------------------------------------------------------- configuration dein
if &compatible
  set nocompatible
endif

" Required:
execute 'set runtimepath+=' . g:repos . '/Shougo/dein.vim'
if dein#load_state(g:dein_cache)
  call dein#begin(g:dein_cache)
  call dein#load_toml(g:config_dir . '/dein.toml', {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" ---------------------------------------------------------------- colorscheme
" custom example: autocmd ColorScheme * highlight CursorLine ctermbg=236
colorscheme orange-moon

" ---------------------------------------------------------------- load surround.vim
execute 'source' (g:config_dir . '/plugins/surround.vim')
