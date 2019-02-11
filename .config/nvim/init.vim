scriptencoding utf-8
augroup vimrc
  autocmd!
augroup END


" python
" let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim-3/bin/python'

" dein.vim {{{"
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成"
let s:toml_dir = fnamemodify(expand('<sfile>'), ':h')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_dir.'/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir.'/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
"不足プラグインの自動インストール"
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
"}}}"

" 基本設定 {{{
set ambiwidth=double "マルチバイト記号対応"
set number "桁表示"
" set backspace=indent,eol,start
set backspace=2
set laststatus=2 "ステータスラインの表示"
set list "スペースの可視化"
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:% "space 対応"
" set clipboard=unnamed "clipbordと対応 矩形ペーストが出来ないのでコメントアウト
set clipboard+=unnamedplus
set noruler
set autoindent "改行時に前の行のインデントを継続する"
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅"
set shiftwidth=2 "自動インデントでずれる幅"
set expandtab "タブ入力を複数の空白入力に置き換える"
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する"
set shell=/bin/zsh
set noshellslash
set noswapfile
set nobackup
set hid
set autoread
set smarttab
set cmdheight=1
set wildmenu
set wildmode=longest,list,full
set formatoptions+=mM
set showmatch
set nowrap
set scrolloff=10
set fileformats=unix,dos,mac
set fileformat=unix
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=block
set maxmempattern=2000
" set autochdir
set ignorecase
set smartcase
set wrapscan
set hlsearch
set ttimeout " 日本語対応用
set ttimeoutlen=50 " 日本語対応用
set completeopt+=noselect " deoplete用
autocmd BufEnter * silent! :lcd%:p:h
" ミュート
set t_vb=
set visualbell
set noerrorbells
"}}}

" キー変更{{{
let mapleader = "\<Space>"
noremap ; :
imap <c-j> <esc>:w<CR>
imap <c-k> <esc>l<c-v>$<DEL>a
nmap <c-k> <c-v>$<DEL>a
noremap j gj
noremap k gk
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
"}}}

" ファイルタイプ {{{
filetype on
filetype plugin on

au FileType * setlocal formatoptions-=ro
au BufRead,BufNewFile *.jsx setf javascript.jsx "jsx -> javascript
au BufNewFile,BufRead *.ctp setf html "ctp -> html
au FileType vim setlocal foldmethod=marker " 折り返し
"}}}

" color設定 {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256  "screen が 256色"
set termguicolors  "True Colorを使用"
colorscheme gruvbox
set background=dark
if (exists('+colorcolumn'))
    set colorcolumn=100
    highlight ColorColumn ctermbg=9
endif
syntax enable
" }}}

" diff
let unified_diff#executable = 'git'
let unified_diff#arguments = ['diff', '--no-index', '--no-color', '--no-ext-diff', '--unified=0']
let unified_diff#iwhite_arguments = ['--ignore--all-space']

" php設定 {{{
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
"}}}

" git 実行コマンド
let g:gitgutter_max_signs = 5000

" sql
" let g:sql_type_default = 'mysql'
let g:omni_sql_no_default_maps = 1


"rg grep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" 選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
" 選択した文字列を置換
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
" カーソル下の単語をgrepsする
nnoremap <c-g><c-g> :grep<Space><c-r><c-w><Enter>
" ctags
if has('path_extra')
	set tags+=tags;
endif
noremap <C-]> g<C-]>
