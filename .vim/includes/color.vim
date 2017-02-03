"==================================================================================
" colorscheme
"==================================================================================
call dein#add('morhetz/gruvbox')

set t_Co=256
colorscheme gruvbox
set background=dark

if (exists('+colorcolumn'))
    set colorcolumn=100
    highlight ColorColumn ctermbg=9
endif


"==================================================================================
" syntax
"==================================================================================

" javascript
call dein#add('jelera/vim-javascript-syntax')

" jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" xhtml
au BufNewFile,BufRead *.ctp,*.xhtml,*.xht setf xhtml


"==================================================================================
" log
"==================================================================================
call dein#add('vim-scripts/AnsiEsc.vim')


"==================================================================================
" unite
"==================================================================================
call dein#add('ujihisa/unite-colorscheme', {'depends' : 'Shougo/unite.vim'})

"==================================================================================
" neovim
"==================================================================================
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
