NeoBundle 'chrismetcalf/vim-yankring' " yankring
NeoBundle 'mrk21/yaml-vim' " yaml
NeoBundle 'bronson/vim-trailing-whitespace' " FixWhitespaceで空白を削除する


" Yanktmp.vim
NeoBundle 'vim-scripts/yanktmp.vim' " 他のvimのコピーを使える
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
NeoBundle 'junegunn/vim-easy-align' " align
vmap <Enter> <Plug>(EasyAlign)


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
