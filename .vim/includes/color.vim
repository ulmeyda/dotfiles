"==================================================================================
" colorscheme
"==================================================================================
NeoBundle 'morhetz/gruvbox'

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
NeoBundle 'jelera/vim-javascript-syntax'

" jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" xhtml
au BufNewFile,BufRead *.ctp,*.xhtml,*.xht setf xhtml


"==================================================================================
" log
"==================================================================================
NeoBundle 'vim-scripts/AnsiEsc.vim'

