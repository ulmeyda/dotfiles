"==================================================================================
" Coding
"==================================================================================
NeoBundle 'kana/vim-textobj-user' " textobj

" コメント
NeoBundle "scrooloose/nerdcommenter"

" %でカッコだけじゃなく、タグの始まりと終わりに移動できるようにする。
NeoBundle "gregsexton/MatchTag" " tagの色づけ
NeoBundle "tmhedberg/matchit"

" fでの検索移動を続けて行える。
NeoBundle "rhysd/clever-f.vim"

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
" 文字位置調整
NeoBundle 'junegunn/vim-easy-align' " align
vmap <Enter> <Plug>(EasyAlign)

" quickrun
NeoBundle 'thinca/vim-quickrun'
augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *test.php set filetype=php.unit
augroup END
" 初期化
let g:quickrun_config = {}
" PHPUnit
let g:quickrun_config['php.unit'] = {'command': 'phpunit'}

" cake php test用
nnoremap <leader>ct :exe "!clear; ".FindRootDirectory()."/app/Console/cake test %:p"<CR>

"==================================================================================
" yank
"==================================================================================
NeoBundle 'LeafCage/yankround.vim'
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
" nmap ,p <Plug>(yankround-prev)
"  nmap ,n <Plug>(yankround-next)

let g:yankround_use_region_hl = 1


" Yanktmp.vim
NeoBundle 'vim-scripts/yanktmp.vim'
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" vimのyankで保存処理を普通のエディタと同じにする。
vnoremap p "_dP



"==================================================================================
" Unite
"==================================================================================
NeoBundle 'Shougo/unite.vim' "unite
NeoBundle 'Shougo/unite-outline' "outline
NeoBundle 'Shougo/neomru.vim' "mru
let g:unite_update_time = 1000
let g:unite_source_file_mru_limit = 200
nnoremap <silent> <Space>m :Unite file_mru<CR>
nnoremap <silent> <Space>b :Unite buffer<CR>
" nnoremap <silent> <Space>f :Unite file<CR>
nnoremap <silent> <Space>f :UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Space>o :Unite outline<CR>
nnoremap <silent> <Space>y :Unite yankround<CR>

" 検索結果をwin
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep cwin



"==================================================================================
" リファレンス
"==================================================================================
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



"==================================================================================
" syntastic
"==================================================================================
"NeoBundle 'scrooloose/syntastic' " コードチェック
"
"let g:syntastic_enable_signs = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_echo_current_error = 1
"let g:syntastic_auto_loc_list = 2
"let g:syntastic_enable_highlighting = 1
""let g:syntastic_auto_jump = 1
"let g:syntastic_php_php_args = '-l'
"let g:syntastic_php_checkers=['php']
"let g:syntastic_csslint_options = "--ignore=adjoining-classes,unqualified-attributes,box-model"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
""let g:syntastic_javascript_checker = "jshint"



"==================================================================================
" diff
"==================================================================================
NeoBundle 'lambdalisue/vim-unified-diff' " vimdiffのアルゴリズム変更

" vim-diff
set diffexpr=unified_diff#diffexpr()

" configure with the followings (default values are shown below)
let unified_diff#executable = 'git'
let unified_diff#arguments = [
    \   'diff', '--no-index', '--no-color', '--no-ext-diff', '--unified=0',
    \ ]
let unified_diff#iwhite_arguments = [
    \   '--ignore--all-space',
    \ ]



"==================================================================================
" HTML, CSS
"==================================================================================
NeoBundle 'hail2u/vim-css3-syntax'
"NeoBundle 'taichouchou2/html5.vim'


"==================================================================================
" JavaScript
"==================================================================================

"Simple-Javascript-Indenter
NeoBundle 'jiangmiao/simple-javascript-indenter' "javascriptのインデント
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1



"==================================================================================
" PHP
"==================================================================================
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let php_parent_error_close = 1
let php_parent_error_open = 1

NeoBundle 'akiyan/vim-textobj-php' " phpタグ選択 vaP or viP

" PDV
NeoBundle 'PDV--phpDocumentor-for-Vim' " PHP用コメント挿入
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>-
" let g:pdv_cfg_Type = "string"
" let g:pdv_cfg_Package = ""
" let g:pdv_cfg_Version = "$id$"
" let g:pdv_cfg_Author = ""
" let g:pdv_cfg_Copyright = "Copyright (C)"
" let g:pdv_cfg_License = ""
let g:pdv_re_indent = ''


" Cake.vim
NeoBundle 'violetyk/cake.vim' " CakePHP用
" バッファで開くキーバインド設定
nnoremap <Space>cc :Ccontroller
nnoremap <Space>cm :Cmodel
nnoremap <Space>cv :Cview
nnoremap <Space>cvw :Ccontrollerview
nnoremap <Space>cs :Cshell
nnoremap <Space>ct :Ctask
nnoremap <Space>ccf :Cconfig
nnoremap <Space>ccp :Ccomponent
nnoremap <Space>cl :Clog


"==================================================================================
" git
"==================================================================================

" 実行コマンド
NeoBundle "tpope/vim-fugitive"
NeoBundle "airblade/vim-gitgutter"
let g:gitgutter_max_signs = 5000
autocmd QuickFixCmdPost *grep* cwindow


" ログ確認用
NeoBundle "cohama/agit.vim"

" branch確認用
NeoBundle "idanarye/vim-merginal.git"


"==================================================================================
" DB, SQL
"==================================================================================
NeoBundle "stardiviner/AutoSQLUpperCase.vim"
let g:sql_type_default = 'mysql'


"==================================================================================
" YAML
"==================================================================================
NeoBundle 'mrk21/yaml-vim' " yaml

