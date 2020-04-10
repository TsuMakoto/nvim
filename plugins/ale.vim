" エラー行の表示マーカー
let g:ale_sign_error = '>>'
" 警告行の表示マーカー
let g:ale_sign_warning = '!!'
" エラー行にカーソルを合わせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%linter%]'
" エラー行の列を常時表示
let g:ale_echo_column_always = 1

" ファイルを開いたときにlint実行
let g:ale_lint_on_enter = 1
" ファイルを保存したときにlint実行
let g:ale_lint_on_save = 1
" 編集中はlintしない
let g:ale_lint_on_text_changed = 'never'

" lint結果をロケーションリストとQuickFixは表示しない
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" rubocopをbendleで使う
" let g:ale_ruby_rubocop_executable = 'bundle'

" 有効にするlinter
let g:ale_linters = {
\	'python' : ['flake8'],
\   'html' : [],
\   'css' : ['stylelint'],
\   'javascript' : ['eslint'],
\   'ruby' : ['rubocop'],
\   'dockerfile' : ['hadolint'],
\   'vue': ['eslint']
\
\}

" ソースコード自動整形
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'vue' : ['eslint'],
\   'python': ['autopep8', 'isort'],
\   'ruby': ['rubocop'],
\   'markdown': [
\   {
\       buffer,
\       lines ->
\       {
\           'command': 'textlint -c ~/.config/textlintrc -o /dev/null --fix --no-color --quiet %t',
\           'read_temporary_file': 1
\       }
\   }
\ ],
\ }
" 保存がかけられるたびに自動整形
let g:ale_fix_on_save = 1

" ALEプレフィックス
nmap [ale] <Nop>
map <C-k> [ale]
" エラー行にジャンプ
nmap <slient> [ale]<C-p> <Plug>(ale_previous)
nmap <slient> [ale]<C-N> <Plug>(ale_next)
