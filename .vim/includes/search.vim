NeoBundle 'ctrlp.vim'
NeoBundle 'nixprime/cpsm'

" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase

" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan

" 検索結果文字列のハイライトを有効にする
set hlsearch

"注意: この内容は:filetype onよりも後に記述すること。
autocmd FileType *
    \   if &l:omnifunc == ''
    \ |   setlocal omnifunc=syntaxcomplete#Complete
    \ | endif

" 選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" 選択した文字列を置換
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

" ==============================================================
" 検索結果数表示
" ==============================================================
NeoBundle "osyo-manga/vim-anzu.git"

" キーマップ設定
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" ESC2回押しで検索ハイライトを消去
nmap <silent> gh :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)
" format = (該当数/全体数)
let g:anzu_status_format = "(%i/%l)"


" ==============================================================
" grep
" ==============================================================
" jvgrep
set grepprg=jvgrep

NeoBundle 'grep.vim'
let MyGrep_ShellEncoding = 'utf-8'

" :Gb <args> でGrepBufferする
command! -nargs=1 Gb :GrepBuffer <args>

" カーソル下の単語をGrepBufferする
nnoremap <c-g><c-b> :<c-u>GrepBuffer<Space><c-r><c-w><Enter>

" カーソル下の単語をgrepsする
nnoremap <c-g><c-g> :Grep<Space><c-r><c-w><Enter>



" ==============================================================
" ctags
" ==============================================================
if has('path_extra')
	set tags+=tags;
endif

" tagsジャンプの時に複数ある時は一覧表示
noremap <C-]> g<C-]>
