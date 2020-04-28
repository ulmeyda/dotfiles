call plug#begin(stdpath('data') . '/plugged')

Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'buoto/gotests-vim', { 'for': ['go'] }
Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-rooter'
Plug 'thinca/vim-qfreplace'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'gregsexton/MatchTag'
Plug 'tmhedberg/matchit'
Plug 'lambdalisue/vim-unified-diff'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot' " syntax/インデント
Plug '/usr/local/opt/fzf' " fzf
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim' " .editconfig
Plug 'vim-scripts/MultipleSearch'
Plug 'bfredl/nvim-miniyank' " nvimの矩形選択yankバグ対応

call plug#end()

scriptencoding utf-8
augroup vimrc
  autocmd!
augroup END

" python
" let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim-3/bin/python'

" 基本設定 {{{
set ambiwidth=double "マルチバイト記号対応"
set number "桁表示"
set clipboard+=unnamed
" set backspace=indent,eol,start
set backspace=2
set laststatus=2 "ステータスラインの表示"
set list "スペースの可視化"
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:% "space 対応"
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
"set completeopt+=noselect " deoplete用
set pumblend=5 "floating widnow
autocmd BufEnter * silent! :lcd%:p:h
" set cursorline
" ミュート
set t_vb=
set visualbell
set noerrorbells

" コメントアウト行後の改行時にコメントアウトを入れない
autocmd FileType * setlocal formatoptions-=ro
"}}}

" キー変更{{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
let mapleader = "\<Space>"
noremap ; :
inoremap <silent> jj <esc>
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
au FileType vim,go setlocal foldmethod=marker " 折り返し
"}}}

" color設定 {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256  "screen が 256色"
set termguicolors  "True Colorを使用"
set background=dark
if (exists('+colorcolumn'))
    set colorcolumn=100
    highlight ColorColumn ctermbg=9
endif
syntax enable

" neovimでターミナルの色がcolorschemeと違った感じになるのを防ぐ設定
let g:terminal_color_0  = "#1b2b34" "black
let g:terminal_color_1  = "#ed5f67" "red
let g:terminal_color_2  = "#9ac895" "green
let g:terminal_color_3  = "#fbc963" "yellow
let g:terminal_color_4  = "#669acd" "blue
let g:terminal_color_5  = "#c695c6" "magenta
let g:terminal_color_6  = "#5fb4b4" "cyan
let g:terminal_color_7  = "#c1c6cf" "white
let g:terminal_color_background="#1b2b34" "background
let g:terminal_color_foreground="#c1c6cf" "foreground
" }}}

" diff {{{
let unified_diff#executable = 'git'
let unified_diff#arguments = ['diff', '--no-index', '--no-color', '--no-ext-diff', '--unified=0']
let unified_diff#iwhite_arguments = ['--ignore--all-space']
" }}}

" php設定 {{{
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
"}}}

" vim-gitgutter {{{
let g:gitgutter_max_signs = 5000
" }}}

" sql {{{
let g:omni_sql_no_default_maps = 1
" }}}

"grep {{{
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" 検索結果をwin
autocmd QuickfixCmdPost make,*grep* cwin

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
"}}}

" vim-go {{{
let g:go_def_mapping_enabled = 1
let g:go_doc_keywordprg_enabled = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_template_autocreate = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_metalinter_autosave = 0
let g:go_term_mode = 'split'
"let g:go_metalinter_autosave_enabled = ['vet', 'golint']
"let g:go_metalinter_enabled = ['vet', 'errcheck']

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>a :GoAlternate<CR>
au FileType go nmap <leader>o :GoDecls<CR>
" au FileType go nmap <leader>B :<C-u>call <SID>build_go_files()<CR>
" au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>i :GoImplements<CR>
" au FileType go nmap <leader>d :GoDoc<CR>
" au FileType go nmap <leader>s <Plug>(go-def-split) " 単語検索 横split
" au FileType go nmap <leader>v <Plug>(go-def-vertical) " 単語検索 縦split

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" }}}

" color schema {{{
autocmd ColorScheme * highlight Normal ctermbg=none guibg=000000
autocmd ColorScheme * highlight Directory guifg=#40b2e0
autocmd ColorScheme * highlight LineNr ctermfg=11 guifg=#777777
autocmd ColorScheme * highlight Comment guifg=#888888

let ayucolor="mirage"
colorscheme ayu
" }}}

" light line {{{
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename', 'fugitive'] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '[RO]' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '('._.')' : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" }}}

" vim-rooter {{{
 let g:rooter_patterns = ['.git/']
 let g:rooter_manual_only = 1
 let g:rooter_disable_map = 1
" }}}

" vim-fugitive {{{
nnoremap <silent> gl :0Glog<CR>
nnoremap <silent> gb :Gblame<CR>
" }}}

" polyglot {{{
let g:polyglot_disabled = ['markdown']
" }}}

" coc {{{
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

autocmd FileType json syntax match Comment +\/\/.\+$+

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" }}}

" coc snippets {{{
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" }}}

" fzf {{{
nnoremap <silent> <space>m :History<CR>
nnoremap <silent> <space>b :Buffers<CR>
nnoremap <silent> <space>r :Rg<CR>
nnoremap <silent> <space>c :History:<CR>
nnoremap <silent> <space>g :GFiles<CR>
nnoremap <silent> <space>f :Files<CR>

"" floating window
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
autocmd! FileType fzf
autocmd  FileType fzf call SetFZFoptions()
function SetFZFoptions()
set noshowmode noruler nonumber norelativenumber
  tunmap <buffer> <Esc>
endfunction

set winblend=20

hi NormalFloat guibg=None
if exists('g:fzf_colors.bg')
  call remove(g:fzf_colors, 'bg')
endif

if stridx($FZF_DEFAULT_OPTS, '--border') == -1
  let $FZF_DEFAULT_OPTS .= ' --border'
endif

function! FloatingFZF()
  let width = float2nr(&columns * 0.8)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'editor',
        \ 'row': (&lines - height) / 2,
        \ 'col': (&columns - width) / 2,
        \ 'width': width,
        \ 'height': height }

  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! s:get_registers() abort
  redir => l:regs
  silent registers
  redir END

  return split(l:regs, '\n')[1:]
endfunction

function! s:registers(...) abort
  let l:opts = {
        \ 'source': s:get_registers(),
        \ 'sink': {x -> feedkeys(matchstr(x, '\v^\S+\ze.*') . (a:1 ? 'P' : 'p'), 'x')},
        \ 'options': '--prompt="Reg> "'
        \ }
  call fzf#run(fzf#wrap(l:opts))
endfunction

command! -bang Registers call s:registers('<bang>' ==# '!')
nnoremap <silent> <Space>y :Registers<CR>
"}}}
