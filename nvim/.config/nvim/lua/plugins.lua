-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

vim.cmd[[packadd packer.nvim]]

-- plugins保存によるオードコマンド実行
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- pcallの初期化
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- packer初期化
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- install
packer.reset()
local use = packer.use

use {'wbthomason/packer.nvim', opt = true}

-- library
use {'nvim-lua/popup.nvim'}
use {'nvim-lua/plenary.nvim'}
use {'kyazdani42/nvim-web-devicons'}
use {"rcarriga/nvim-notify", event = "VimEnter"}

-- colorscheme
use({
  "bluz71/vim-nightfly-guicolors",
  opt = true,
  setup = function()
    vim.cmd [[colorscheme nightfly]]
  end,
})

-- treesitter
use({
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("config.treesitter")
  end,
})

-- lsp
use({
  "neovim/nvim-lspconfig",
  requires = {
    "williamboman/nvim-lsp-installer",
    "onsails/lspkind-nvim", -- pictgram
    "folke/lsp-colors.nvim", -- color
  },
  config = function()
    require("config.lsp")
  end,
})

-- go
use {
  'buoto/gotests-vim',  -- testファイル生成
  opt = true,
  ft = {'go'},
  config = function()
    require("config.gotests")
  end,
}
use {'mattn/vim-goaddtags', opt = true, ft = {'go'}} -- tag入れ
use {'mattn/vim-goimports', opt = true, ft = {'go'}} -- 保存で自動import設定
use {'mattn/vim-goimpl', opt = true, ft = {'go'}} -- interface関数から自動作成
use {'mattn/vim-gomod', opt = true, ft = {'go'}} -- gomodのsyntax
use {
  'benmills/vim-golang-alternate',  -- aでtest移動
  opt = true,
  ft = {'go'},
  config = function()
    require("config.alternate")
  end,
}

-- typescript
use {
  'sbdchd/neoformat',
   config = function()
     vim.g.neoformat_try_node_exe = 1
     vim.cmd('autocmd BufWritePre *.tsx,ts,js Neoformat')
   end,
}

-- color
use {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup()
  end,
}

-- test
use {
  "klen/nvim-test",
   config = function()
     require("config.nvim-test")
   end,
}

-- quickfix
use {'kevinhwang91/nvim-bqf'} -- preview

-- replacer
use {
  'gabrielpoca/replacer.nvim',
  config = function()
    require("config.replacer")
  end
}

-- statusline
use {'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require("config.lualine")
  end,
}

-- comment
use {
  'terrortylor/nvim-comment',
  config = function()
    require('nvim_comment').setup({
      line_mapping = ",cc",
      operator_mapping = ",c",
      comment_chunk_text_object = "ic",
    })
  end
}

-- diff
use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

-- translator
use {
  'skanehira/translate.vim',
  config = function()
    require("config.translate")
  end,
}

-- todo comment
use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
}

-- findroot
use {'mattn/vim-findroot'}

-- 連番
use {'deris/vim-rengbang'}

-- git
use {
  'tpope/vim-fugitive',
  config = function()
    require("config.fugitive")
  end
}
use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('gitsigns').setup()
  end
}
use {
  'rhysd/git-messenger.vim',
  config = function()
    require("config.git-messenger")
  end
}

-- editorconfig
use {'editorconfig/editorconfig-vim'}

-- sandwitch
use {'machakann/vim-sandwich'}

-- fzf
use {
  'ibhagwan/fzf-lua',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require("config.fzf")
  end,
}
use {'junegunn/fzf', run = './install --bin'}

-- cmp
use({
  "hrsh7th/nvim-cmp",
  requires = {
    {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
    {"hrsh7th/cmp-buffer", after = "nvim-cmp" },
    {"hrsh7th/cmp-vsnip", after = "nvim-cmp" },
    {"hrsh7th/vim-vsnip", after = "nvim-cmp" },
    {"hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
    {"hrsh7th/cmp-cmdline", after = "nvim-cmp" },
  },
  config = function()
    require("config.cmp")
  end,
})

-- filer
use {
  'cocopon/vaffle.vim',
  config = function()
    require("config.vaffle")
  end,
}

-- snippets
use {"rafamadriz/friendly-snippets"}

-- trouble
use {
  "folke/trouble.nvim",
  requires = { { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" } },
  config = function()
    require("config.trouble")
  end
}

if packer_bootstrap then
  require("packer").sync()
end
