" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

source ~/dotfiles/.vim/source/base.vim
source ~/dotfiles/.vim/source/search.vim
source ~/dotfiles/.vim/source/css.vim
source ~/dotfiles/.vim/source/color.vim
source ~/dotfiles/.vim/source/edit.vim
source ~/dotfiles/.vim/source/ref.vim
source ~/dotfiles/.vim/source/move.vim
source ~/dotfiles/.vim/source/statusline.vim
source ~/dotfiles/.vim/source/complete.vim
source ~/dotfiles/.vim/source/php.vim
source ~/dotfiles/.vim/source/javascript.vim
source ~/dotfiles/.vim/source/diff.vim
source ~/dotfiles/.vim/source/syntastic.vim
source ~/dotfiles/.vim/source/encoding.vim

call neobundle#end()

" Required:
filetype plugin indent on

let g:neobundle#types#git#default_protocol = 'git'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
