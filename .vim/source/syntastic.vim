"syntastic
NeoBundle 'scrooloose/syntastic' " コードチェック
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
"let g:syntastic_auto_jump = 1
let g:syntastic_php_php_args = '-l'
let g:syntastic_php_checkers=['php']
let g:syntastic_csslint_options = "--ignore=adjoining-classes,unqualified-attributes,box-model"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checker = "jshint"
