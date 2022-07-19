local actions = require "fzf-lua.actions"
require'fzf-lua'.setup {
  fzf_opts = {
    ['--keep-right'] = '',
    ['--border'] = false,
  },
}
vim.api.nvim_set_keymap("n", "<Space>h", ":lua require('fzf-lua').oldfiles()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Space>b", ":lua require('fzf-lua').buffers()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Space>r", ":Ggrep ", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Space>g", ":lua require('fzf-lua').git_files()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Space>f", ":lua require('fzf-lua').files()<CR>", {silent = true, noremap = true})
