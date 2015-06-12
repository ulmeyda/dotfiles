" シェル
set shell=/bin/zsh
set noshellslash

".swapfile作らない
set noswapfile

" バックアップファイルを作成しない
set nobackup

"編集中の内容を保ったまま別の画面に切替えられるようにする
set hid

"他のファイルでいじったら即リロード
set autoread

" シンタックスハイライトを有効にする
syntax on

"===================================================================
"TAB
"===================================================================

" タブの画面上での幅
set tabstop=4

" cindentやautoindent時に挿入されるタブの幅（tabstop と揃えておくと良い）
set shiftwidth=4
set smarttab

" タブをスペースに展開
set expandtab


"==================================================================
" キーボードショートカット
"==================================================================
"USキーボード使いやすいように
noremap ; :

"mode 変更
imap <c-j> <esc>:w<CR>

"カーソルから後ろ消す
imap <c-k> <esc>l<c-v>$<DEL>a
nmap <c-k> <c-v>$<DEL>a

"移動
nnoremap j gj
nnoremap k gk

"検索語が画面の真ん中に来るようにする
nmap n nzz
nmap N Nzz
nmap * zz
nmap # #zz
nmap g gzz
nmap g# g#zz

"マーク一覧
nmap gm :marks<CR>

