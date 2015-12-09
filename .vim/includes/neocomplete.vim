NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache' " 補完

" neocomplete関連
let g:acp_enableAtStartup = 0
if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplete#auto_completion_start_length = 2

    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'

    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

elseif neobundle#is_installed('neocomplcache')
    " neocomplcache用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_caching_percent_in_statusline = 1
    let g:neocomplcache_enable_skip_completion = 1
    let g:neocomplcache_skip_input_time = '0.5'
    let g:neocomplcache_manual_completion_start_length = 0
    let g:neocomplcache_smart_case = 1

    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ファイルタイプごとに辞書ファイルを指定
autocmd FileType php :set dictionary+=~/.vim/dict/php_functions.dict
autocmd FileType javascript :set dictionary+=~/.vim/dict/jquery.dict
autocmd FileType javascript :set dictionary+=~/.vim/dict/javascript.dict

"辞書ファイルを使用する設定に変更
set complete+=k
