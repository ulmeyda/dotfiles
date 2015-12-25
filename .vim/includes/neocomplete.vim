" vim-snippets
" neoinclude.vim
" neocomplete.vim {{{
NeoBundleLazy 'Shougo/neocomplete.vim', {'depends': ['KazuakiM/vim-snippets', 'Shougo/neoinclude.vim'], 'insert': 1}
let s:hooks = neobundle#get_hooks('neocomplete.vim')
function! s:hooks.on_source(bundle) abort "{{{
	"neocomplete.vim
	let g:neocomplete#auto_completion_start_length     = 3
	let g:neocomplete#data_directory                   = $HOME .'/.vim/neocomplete.vim'
	let g:neocomplete#delimiter_patterns               = {'php': ['->', '::', '\']}
	let g:neocomplete#enable_at_startup                = 1
	let g:neocomplete#enable_auto_close_preview        = 3
	let g:neocomplete#enable_auto_delimiter            = 1
	let g:neocomplete#enable_auto_select               = 0
	let g:neocomplete#enable_fuzzy_completion          = 0
	let g:neocomplete#enable_smart_case                = 1
	let g:neocomplete#keyword_patterns                 = {'_': '\h\w*'}
	let g:neocomplete#lock_buffer_name_pattern         = '\.log\|.*quickrun.*\|.jax'
	let g:neocomplete#max_keyword_width                = 30
	let g:neocomplete#max_list                         = 8
	let g:neocomplete#min_keyword_length               = 3
	let g:neocomplete#sources                          = {'_': ['file', 'dictionary', 'buffer']}
	let g:neocomplete#sources#buffer#cache_limit_size  = 50000
	let g:neocomplete#sources#buffer#disabled_pattern  = '\.log\|\.jax'
	let g:neocomplete#sources#buffer#max_keyword_width = 30
	let g:neocomplete#sources#dictionary#dictionaries  = {
			\ '_': '',
			\ 'php': '~/.vim/dict/php_functions.dict',
			\'javascript': '~/.vim/dict/jquery.dict,~/.vim/dict/javascript.dict'
	\ }
	let g:neocomplete#sources#omni#input_patterns      = {'go': '\h\w\.\w*'}
	let g:neocomplete#use_vimproc                      = 1

	"neoinclude.vim
	let g:neoinclude#exts          = {'php': ['php', 'inc', 'tpl', 'ctp']}
	let g:neoinclude#max_processes = 5

	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
endfunction "}}}
"}}}
