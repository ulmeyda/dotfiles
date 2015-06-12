NeoBundle 'kana/vim-textobj-user' " textobj
NeoBundle 'akiyan/vim-textobj-php' " phpタグ選択 vaP or viP

" pdv
NeoBundle 'PDV--phpDocumentor-for-Vim' " PHP用コメント挿入
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>-
" let g:pdv_cfg_Type = "string"
" let g:pdv_cfg_Package = ""
" let g:pdv_cfg_Version = "$id$"
" let g:pdv_cfg_Author = "Shinya Sato"
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
