NeoBundle 'editorconfig/editorconfig-vim'

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
set tabstop=2

" cindentやautoindent時に挿入されるタブの幅（tabstop と揃えておくと良い）
set shiftwidth=2
set smarttab

" タブをスペースに展開
set expandtab


"==================================================================
" キーボードショートカット
"==================================================================
let mapleader = ","

"USキーボード使いやすいように
noremap ; :

"mode 変更
imap <c-j> <esc>:w<CR>

"カーソルから後ろ消す
imap <c-k> <esc>l<c-v>$<DEL>a
nmap <c-k> <c-v>$<DEL>a

"移動
noremap j gj
noremap k gk

"検索語が画面の真ん中に来るようにする
nmap n nzz
nmap N Nzz
nmap * zz
nmap # #zz
nmap g gzz
nmap g# g#zz

"マーク一覧
nmap gm :marks<CR>

" バッファ削除
map gw :bw<CR>

set clipboard=unnamed

" コマンドラインの高さ
set cmdheight=1
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
set wildmode=longest,list,full
set formatoptions+=mM


"==================================================================
" 入力
"==================================================================

"backスペース
set backspace=indent,eol,start

" バックスペースでインデントや改行を削除できるようにする
set backspace=2

" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
set smartindent

" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch

" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap

" コメントあとの改行でコメントにしない
au FileType * setlocal formatoptions-=ro

" タブや改行を表示 (list:表示)
"set list
"set listchars=tab:>\
"set listchars=tab:>.,trail:_,nbsp:%,extends:>,precedes:<
"
" 行番号を非表示 (number:表示)
set number
set scrolloff=10    "スクロール時に表示を5行確保

" ルーラーを表示 (noruler:非表示)
set noruler

"改行コードの自動認識
set fileformats=unix,dos,mac
set fileformat=unix

"クリップボード用
set clipboard=unnamed

"行頭・行末間移動
set whichwrap=b,s,h,l,<,>,[,]

"矩形選択で自由に移動する
set virtualedit+=block

"directory変更
set autochdir


"==================================================================
" vimshell
"==================================================================
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
nnoremap <Leader>v  :<C-u>VimShell<CR>

