"==================================================================================
" dein
"==================================================================================
if &compatible
  set nocompatible
endif
set runtimepath+=~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/dotfiles/.vim/dein'))

call dein#add('morhetz/gruvbox')
" color
call dein#add('jelera/vim-javascript-syntax')
call dein#add('vim-scripts/AnsiEsc.vim')
" coding
call dein#add('editorconfig/editorconfig-vim')
call dein#add('airblade/vim-rooter')
call dein#add('Shougo/vimproc')
call dein#add('Shougo/vimshell')
call dein#add('kana/vim-textobj-user')
call dein#add('surround.vim')
call dein#add("scrooloose/nerdcommenter")
call dein#add("gregsexton/MatchTag")
call dein#add("tmhedberg/matchit")
call dein#add('mrk21/yaml-vim')
call dein#add('violetyk/cake.vim')
call dein#add('akiyan/vim-textobj-php')
call dein#add("rhysd/clever-f.vim")
call dein#add('vim-scripts/yanktmp.vim') 
call dein#add('thinca/vim-quickrun') 
call dein#add('junegunn/vim-easy-align')
call dein#add('LeafCage/yankround.vim') 
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('thinca/vim-ref')
call dein#add('mojako/ref-sources.vim')
call dein#add('mustardamus/jqapi')
call dein#add('tokuhirom/jsref')
call dein#add('lambdalisue/vim-unified-diff')
call dein#add("tpope/vim-fugitive")
call dein#add("airblade/vim-gitgutter")
call dein#add("cohama/agit.vim")
call dein#add("idanarye/vim-merginal.git")
call dein#add("stardiviner/AutoSQLUpperCase.vim")
call dein#add('hail2u/vim-css3-syntax') 
"call dein#add('taichouchou2/html5.vim') 
call dein#add('jiangmiao/simple-javascript-indenter')
call dein#add('PDV--phpDocumentor-for-Vim')
call dein#add('ctrlp.vim')
call dein#add('nixprime/cpsm')
call dein#add('grep.vim')
call dein#add("osyo-manga/vim-anzu.git")
call dein#add('Shougo/deoplete.nvim')
call dein#add("Shougo/denite.nvim")

source ~/dotfiles/.vim/includes/statusline.vim
source ~/dotfiles/.vim/includes/encoding.vim
call dein#end()

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif


"==================================================================================
" base
"==================================================================================
" set clipboard+=unnamedplus
set clipboard=unnamed
set shell=/bin/zsh
set noshellslash
set noswapfile
set nobackup
set hid
set autoread
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set cmdheight=1
set wildmenu
set wildmode=longest,list,full
set formatoptions+=mM
" set backspace=indent,eol,start
set backspace=2
set autoindent
set smartindent
set showmatch
set nowrap
au FileType * setlocal formatoptions-=ro
set number
set scrolloff=10
set noruler
set fileformats=unix,dos,mac
set fileformat=unix
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit+=block
set autochdir
set ignorecase
set smartcase
set wrapscan
set hlsearch
autocmd BufEnter * silent! :lcd%:p:h

"==================================================================
" key alias
"==================================================================
let mapleader = ","
noremap ; :
imap <c-j> <esc>:w<CR>
imap <c-k> <esc>l<c-v>$<DEL>a
nmap <c-k> <c-v>$<DEL>a
noremap j gj
noremap k gk
nmap n nzz
nmap N Nzz
nmap * zz
nmap # #zz
nmap g gzz
nmap g# g#zz
nmap gm :marks<CR>
map gw :bw<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nmap <BS> <C-W>h
" vimのyankで保存処理を普通のエディタと同じにする。
vnoremap p "_dP

"==================================================================
" plugin setting 
"==================================================================

" vim-rooter
let g:rooter_patterns = ['.git/']
let g:rooter_manual_only = 1
let g:rooter_disable_map = 1

" vimshell
nnoremap <Leader>v  :<C-u>VimShell<CR>

"==================================================================================
" color
"==================================================================================
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
set t_Co=256
colorscheme gruvbox
set background=dark
if (exists('+colorcolumn'))
    set colorcolumn=100
    highlight ColorColumn ctermbg=9
endif

" jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" xhtml
au BufNewFile,BufRead *.ctp,*.xhtml,*.xht setf xhtml


"==================================================================================
" Coding
"==================================================================================

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" QuickRun
augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *test.php set filetype=php.unit
augroup END
let g:quickrun_config = {}
let g:quickrun_config['php.unit'] = {'command': 'phpunit'}

" cake php test用
nnoremap <leader>ct :exe "!clear; ".FindRootDirectory()."/app/Console/cake test %:p"<CR>

" Yanktmp.vim
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 3
set completeopt+=noinsert
set completeopt-=preview
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.html       = '<[^>]*'
let g:deoplete#omni#input_patterns.md         = '<[^>]*'
let g:deoplete#omni#input_patterns.css        = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.scss       = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.sass       = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#omni#input_patterns.php        = '\w+|[^. \t]->\w*|\w+::\w*'


" denite
nnoremap <silent> <Space>m :Denite file_mru<CR>
nnoremap <silent> <Space>b :Denite buffer<CR>
nnoremap <silent> <Space>y :Denite neoyank<CR>
"nnoremap <silent> <Space>g :Denite grep<CR>
"nnoremap <silent> <Space>g :call denite#start([{'name': 'grep', 'args': [FindRootDirectory()]}])<CR>
nnoremap <silent> <Space>l :Denite line<CR>
nnoremap <silent> <Space>f :call denite#start([{'name': 'file_rec', 'args': [FindRootDirectory()]}])<CR>

" cpsm
" call denite#custom#map('_', "\<C-n>", 'move_to_next_line')
" call denite#custom#map('_', "\<C-p>", 'move_to_prev_line')
" call denite#custom#source('file_rec', 'matcher', ['matcher_cpsm'])

hi CursorLine guifg=#ff0000

" 検索結果をwin
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep cwin


"==================================================================================
" リファレンス
"==================================================================================

" ref.vim
let g:ref_phpmanual_path = $HOME . '/.vim/dict/php-chunked-xhtml'
let g:ref_perldoc_complete_head = 1

"ref-sources.vim
let g:ref_jquery_doc_path = $HOME . '/.vim/bundle/jqapi'
let g:ref_javascript_doc_path = $HOME . '/.vim/bundle/jsref/htdocs'

" syntastic
" call dein#add('scrooloose/syntastic') " コードチェック
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
" JavaScript
"==================================================================================

"Simple-Javascript-Indenter
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


" PDV
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
let g:gitgutter_max_signs = 5000
autocmd QuickFixCmdPost *grep* cwindow


"==================================================================================
" DB, SQL
"==================================================================================
let g:sql_type_default = 'mysql'


"==================================================================================
" search
"==================================================================================

" jvgrep
set grepprg=jvgrep

" ctrlp
let g:ctrlp_extensions = ['buffertag']

" 選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
" 選択した文字列を置換
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

" キーマップ設定
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" ESC2回押しで検索ハイライトを消去
nmap <silent> gh :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)
" format = (該当数/全体数)
let g:anzu_status_format = "(%i/%l)"
let MyGrep_ShellEncoding = 'utf-8'

" :Gb <args> でGrepBufferする
command! -nargs=1 Gb :GrepBuffer <args>

" カーソル下の単語をGrepBufferする
nnoremap <c-g><c-b> :<c-u>GrepBuffer<Space><c-r><c-w><Enter>

" カーソル下の単語をgrepsする
nnoremap <c-g><c-g> :Grep<Space><c-r><c-w><Enter>

" ctags
if has('path_extra')
	set tags+=tags;
endif
noremap <C-]> g<C-]>


""source ~/dotfiles/.vim/includes/neocomplete.vim
"source ~/dotfiles/.vim/includes/deoplete.vim
