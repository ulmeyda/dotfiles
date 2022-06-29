vim.api.nvim_set_keymap('n', 'gm', '<Plug>(git-messenger)', {silent = true, noremap = false})
vim.g.git_messenger_floating_win_opts = {border = 'single' }
vim.g.git_messenger_popup_content_margins = 'v:false'
vim.g.git_messenger_date_format = '%Y年%b月%d日 %X'
