local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map('n',';', ':', {noremap=true, silent=false})
map('n','*', 'zz', {noremap=true, silent=false})
map('n','#', '#zz', {noremap=true, silent=false})
map('n','g', 'gzz', {noremap=true, silent=false})
map('n','g#', 'g#zz', {noremap=true, silent=false})
map('n','j', 'gj', {noremap=true, silent=false})
map('n','k', 'gk', {noremap=true, silent=false})
map('n','k', 'gk', {noremap=true, silent=false})
map('n','gw', ':bw<CR>', {noremap=false, silent=false})
map('i','<C-j>', '<esc>', {noremap=false, silent=true})
map('n','<C-j>', '<C-w>j', {noremap=false, silent=false})
map('n','<C-k>', '<C-w>k', {noremap=false, silent=false})
map('n','<C-l>', '<C-w>l', {noremap=false, silent=false})
map('n','<C-h>', '<C-w>h', {noremap=false, silent=false})
map('v','p', '"_dP', {noremap=true, silent=false}) -- vimのyankで保存処理を普通のエディタと同じにする。
map('v', '//', 'y/<C-R>=escape(@", "\\/.*$^~[]")<CR><CR>', {noremap=true, silent=true}) -- 選択した文字列を検索
map('v', '/r', '"xy:%s/<C-R>=escape(@x, "\\/.*$^~[]")<CR>//gc<Left><Left><Left>', {noremap=true, silent=false}) -- 選択した文字列を置換
map('n', '<c-g><c-g>', ':grep<Space><c-r><c-w><Enter>', {noremap=true, silent=false}) -- カーソル下の単語をgrepsする
map('n', '<C-]>', 'g<C-]>', {noremap=true, silent=false}) --
