" Release keymappings for plug-in.
nnoremap j gj
nnoremap k gk

" Edit init.vim
nnoremap <Space>ev :tabnew ~/.dotfiles/vim/init.vim<CR>
" Reload init.vim
nnoremap <Space>rv :source ~/.dotfiles/vim/init.vim<CR>
" Open vim config-dir
nnoremap <Space>rd :NERDTreeToggle ~/.dotfiles/vim<CR>

" new tab
nnoremap <Space>tn :tabnew<CR>

" switch tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT
for i in range(1, 9)
  execute 'nnoremap ' . i . '<Tab> ' . i . 'gt'
endfor

" resize tab
nnoremap <C-w>; <C-w>+

" Skip move
nnoremap H ^
noremap L $
xnoremap H ^
xnoremap L $

" denite 起動
" nmap <Space>df :Denite file/rec<CR>

" terminal mode
tnoremap <C-[> <C-\><C-n>
