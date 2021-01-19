" ---------------------------------------------------------------- variable
let g:cache = $HOME . '/.cache'
let g:dein_cache = g:cache . '/dein'
let g:repos = g:dein_cache . '/repos/github.com'
let g:dein_git = 'https://github.com/Shougo/dein.vim'
let g:config_dir = $HOME . '/.config/nvim'
let mapleader = ","

" ---------------------------------------------------------------- initialized
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamed
set clipboard+=unnamedplus
set foldmethod=marker
set shell=zsh
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" ---------------------------------------------------------------- language server
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
"
" " IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" let g:default_julia_version = '1.4'
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
" \   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
" \       using LanguageServer;
" \       using Pkg;
" \       import StaticLint;
" \       import SymbolServer;
" \       env_path = dirname(Pkg.Types.Context().env.project_file);
" \       debug = false;
" \
" \       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "");
" \       server.runlinter = true;
" \       run(server);
" \   ']
" \ }

" ---------------------------------------------------------------- mapping

" Release keymappings for plug-in.
nnoremap j gj
nnoremap k gk

" Edit init.vim
nnoremap <Space>ev :tabnew ~/.config/nvim/init.vim<CR>
" Reload init.vim
nnoremap <Space>rv :source ~/.config/nvim/init.vim<CR>

" Edit .zshrc
nnoremap <Space>ze :tabnew ~/.dotfiles/.zshrc<CR>
" Reload init.vim
nnoremap <Space>rz :source ~/.dotfiles/.zshrc<CR>

" Open .dotfiles dirrectory
nnoremap <Space>rd :NERDTreeToggle ~/.dotfiles<CR>

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
inoremap <Left>  <C-[><C-w>h
inoremap <Down>  <C-[><C-w>j
inoremap <Up>    <C-[><C-w>k
inoremap <Right> <C-[><C-w>l
inoremap <S-Left>  <C-[><C-w>H
inoremap <S-Down>  <C-[><C-w>J
inoremap <S-Up>    <C-[><C-w>K
inoremap <S-Right> <C-[><C-w>L

" tabular
xnoremap <tab> :Tab /

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

nmap <Space>ee :e ++enc=utf-8<CR>

nmap <F12> :TagbarToggle<CR>

" fzf search
nnoremap <C-p> :FZFFileList<CR>
command! FZFFileList call fzf#run(fzf#wrap({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'down': '40%'}))

autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead Dockerfile* setf dockerfile
augroup vimrc-set-regexpengine
  autocmd!
  autocmd BufNewFile,BufReadPre *.rb,*.erb setlocal regexpengine=1
augroup end

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" ---------------------------------------------------------------- rcファイル読み込み
" function! s:source_rc(rc_file_name)
"   let rc_file = expand(g:g:config_dir . '/rc' . a:rc_file_name)
"   if filereadable(rc_file)
"     execute 'source' rc_file
"   endif
" endfunction

" ---------------------------------------------------------------- load python
if isdirectory($PYENV_ROOT)
  let g:python_host_prog =  $PYENV_V2_PATH=="" ? $PYENV_ROOT . '/versions/2.7.16/bin/python' : $PYENV_V2_PATH
  let g:python3_host_prog = $PYENV_V3_PATH=="" ? $PYENV_ROOT . '/versions/3.6.0/bin/python' : $PYENV_V3_PATH
endif

" ---------------------------------------------------------------- load ruby
if isdirectory($RBENV_ROOT)
  let g:ruby_host_prog = $RBENV_PATH=="" ? $RBENV_ROOT . '/versions/2.7.1/bin/neovim-ruby-host' : $RBENV_V_PATH
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
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
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
" +++ happy_hacking +++
" autocmd ColorScheme * set hlsearch
" autocmd ColorScheme * highlight Search ctermbg=gray
" autocmd ColorScheme * highlight Search guibg=gray
" +++ happy_hacking +++

" colorscheme one

let g:neodark#use_256color = 1
let g:neodark#solid_vertsplit = 1
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'
let g:neodark#use_custom_terminal_theme = 1
colorscheme neodark

" ---------------------------------------------------------------- load surround.vim
execute 'source' (g:config_dir . '/plugins/surround.vim')
