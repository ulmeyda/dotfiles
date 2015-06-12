"Unite.vim
NeoBundle 'Shougo/unite.vim' "unite
NeoBundle 'Shougo/unite-outline' "outline
NeoBundle 'Shougo/neomru.vim' "mru
let g:unite_update_time = 1000
let g:unite_source_file_mru_limit = 200
nnoremap <silent> <Space>m :Unite file_mru<CR>
nnoremap <silent> <Space>b :Unite buffer<CR>
nnoremap <silent> <Space>f :Unite file<CR>
nnoremap <silent> <Space>o :Unite outline<CR>

" バッファ削除
map gw :bw<CR>

" 検索結果をwin
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep cwin
