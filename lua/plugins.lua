local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'antoinemadec/FixCursorHold.nvim'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'windwp/nvim-ts-autotag'

  -- File Tree
  use {
    "kyazdani42/nvim-tree.lua",
    keys = {"<C-b>"},
    cmd = {
      "NvimTreeToggle",
      "NvimTreeOpen",
      "NvimTreeClose",
      "NvimTreeFocus",
      "NvimTreeFindFileToggle",
      "NvimTreeResize",
      "NvimTreeCollapse",
      "NvimTreeCollapseKeepBuffers",
      "NvimTreeRefresh",
      "NvimTreeFindFile"
    },
    config = function() require("plugins.tree") end
  }

  -- Visual Stuff
  use 'kyazdani42/nvim-web-devicons'
  use 'goolord/alpha-nvim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require("plugins.indent-line") end
  }
  use 'norcalli/nvim-colorizer.lua'
  use {
    'folke/zen-mode.nvim',
    cmd = { "ZenMode" },
    config = function() require("plugins.zen-mode") end
  }

  -- Lines
  use 'nvim-lualine/lualine.nvim'
  use 'romgrk/barbar.nvim'
  -- use 'feline-nvim/feline.nvim'

  -- Editing
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'folke/which-key.nvim'
  use 'unblevable/quick-scope'
  use 'nacro90/numb.nvim'
  -- use 'tpope/vim-sleuth'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    event = "BufReadPre",
    config =  function () require("lsp") end
  } -- enable LSP
  use {
    'williamboman/nvim-lsp-installer',
    cmd = {
      "LspInstall",
      "LspInstallInfo",
      "LspUninstall",
      "LspUninstallAll",
      "LspInstallLog",
      "LspPrintInstalled",
    },
    config = function () require("lsp.lsp-installer") end
  } -- simple to use language server installer
  -- use 'glepnir/lspsaga.nvim'
  -- use 'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
  -- use 'jose-elias-alvarez/null-ls.nvim'

  -- CMP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'hrsh7th/nvim-cmp' -- The completion plugin

  -- Snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use
  use {
    'mattn/emmet-vim',
    event = "InsertEnter",
    config = function () require("plugins.emmet") end
  }

  -- Terminal
  use 'akinsho/toggleterm.nvim'

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function() require("plugins.gitsigns") end
  }
  use {
    'TimUntersberger/neogit',
    cmd = { "Git", "Neogit" }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end) 