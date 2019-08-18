" set number
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamed
set foldmethod=marker
autocmd BufWritePre * :%s/\s\+$//ge

" =============== 色の設定 ===============
" =============== jellybeans ===============
" colorscheme jellybeans
" set cursorline
" autocmd ColorScheme * highlight CursorLine ctermbg=236
" autocmd ColorScheme * highlight Normal ctermbg=none
" autocmd ColorScheme * highlight LineNr ctermbg=none
" autocmd ColorScheme * highlight NonText ctermbg=none
" autocmd ColorScheme * highlight Comment ctermfg=250
" autocmd ColorScheme * highlight Visual ctermbg=240
" autocmd ColorScheme * highlight Statement ctermfg=104
" =============== tender ===============
colorscheme tender
syntax enable
let g:airline_theme = 'tender'
autocmd ColorScheme * highlight Comment guifg=#a09f9f
autocmd ColorScheme * highlight Visual guibg=#666666
" =============== dracula ==============
" syntax on
" colorscheme dracula
" =============== 色の設定 ===============

let g:config_dir = '~/.config/nvim'
let g:rc_dir = g:config_dir . '/rc'

" rcファイル読み込み関数
function! s:source_rc(rc_file_name)
  let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
  if filereadable(rc_file)
    execute 'source' rc_file
  endif
endfunction

" dein用キャッシュディレクトリ作成
let $CACHE = expand('~/.cache')

if !isdirectory(expand($CACHE))
 call mkdir(expand($CACHE), 'p')
endif

let $PYENV_ROOT = $HOME . '/.pyenv/versions'
let g:python_host_prog = $PYENV_ROOT . '/2.7.16/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/3.7.3/bin/python'
let g:ruby_host_prog = $HOME . '/.rbenv/shims/ruby'

" load dein.
let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand('$CACHE/dein')
        \. '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
              \fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

call s:source_rc('dein.rc.vim')
call s:source_rc('mappings.rc.vim')
call s:source_rc('surround.vim')
