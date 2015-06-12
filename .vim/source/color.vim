NeoBundle 'morhetz/gruvbox' " colorscheme

set t_Co=256
colorscheme gruvbox
set background=dark

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif


"jquery color syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" xhtml syntax
au BufNewFile,BufRead *.ctp,*.xhtml,*.xht setf xhtml
