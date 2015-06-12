" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" ステータスラインに文字コードと改行文字を表示する
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P
" コマンドラインの高さ
set cmdheight=1
" コマンドをステータス行に表示
set showcmd
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
set wildmode=longest,list,full
set formatoptions+=mM
" タイトルを表示
set title
" モード表示
set showmode
