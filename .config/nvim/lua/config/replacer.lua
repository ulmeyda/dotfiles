vim.api.nvim_set_keymap('n', '<Space>p', ':lua require("replacer").run({ rename_files = false })<cr>', { silent = true })
