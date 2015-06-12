NeoBundle 'thinca/vim-ref' " マニュアル確認できる
NeoBundle 'mojako/ref-sources.vim' " refに別のマニュアルを追加
NeoBundle 'mustardamus/jqapi' " jQueryのマニュアル
NeoBundle 'tokuhirom/jsref' " JSのマニュアル

" ref.vim
let g:ref_phpmanual_path = $HOME . '/.vim/dict/php-chunked-xhtml'
let g:ref_perldoc_complete_head = 1

"ref-sources.vim
let g:ref_jquery_doc_path = $HOME . '/.vim/bundle/jqapi'
let g:ref_javascript_doc_path = $HOME . '/.vim/bundle/jsref/htdocs'
