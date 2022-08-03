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

return packer.startup( function (use)

  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'antoinemadec/FixCursorHold.nvim'
  -- use 'nathom/filetype.nvim'

  -- Telescope
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    after = 'telescope.nvim',
    event = { 'BufRead', 'BufNewFile' },
    -- run = ':TSUpdate',
    config = function() require("plugins.treesitter") end
  }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter', }
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter', }
  -- use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter', }

  -- File Tree
  use {
    'kyazdani42/nvim-tree.lua',
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
  use {
    'goolord/alpha-nvim',
    config = function() require("plugins.alpha") end
  }
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function() require("plugins.indent-line") end
  }
  use {
    'norcalli/nvim-colorizer.lua',
    ft = { 'html','css','sass','vim','typescript','typescriptreact'},
    config = function() require("plugins.colorizer") end
  }
  use {
    'folke/zen-mode.nvim',
    cmd = { "ZenMode" },
    config = function() require("plugins.zen-mode") end
  }

  -- Lines
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require("plugins.lualine") end
  }

  -- Editing
  use {
    'numToStr/Comment.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function () require("plugins.comment") end
  }
  use {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function () require("plugins.autopairs") end
  }
  use {
    'tpope/vim-repeat',
    event = { "BufRead", "BufNewFile" },
  }
  use {
    'tpope/vim-surround',
    event = { "BufRead", "BufNewFile" },
  }
  use {
    'folke/which-key.nvim',
    keys = { "<Leader>" },
    -- event = { "BufRead", "BufNewFile" },
    config = function () require("plugins.which-key") end
  }
  use {
    'unblevable/quick-scope',
    config = function() require("plugins.quick-scope") end
  }
  use {
    'nacro90/numb.nvim',
    config = function() require("plugins.numb") end
  }
  use {
    'AckslD/nvim-neoclip.lua',
    requires = {
      -- {'tami5/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = function() require('plugins.neoclip') end,
    -- after = 'telescope.nvim',
    -- cmd = { "Telescope" }
  }
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
  } -- simple to use language server installer
  use { 
    'kkharji/lspsaga.nvim',
    config = function() require("lspsaga") end
  }
  -- use 'glepnir/lspsaga.nvim'
  -- use 'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
  -- use 'jose-elias-alvarez/null-ls.nvim'

  -- CMP
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions

  -- Snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use
  use {
    'mattn/emmet-vim',
    config = function () require("plugins.emmet") end
  }

  -- Terminal
  use {
    'akinsho/toggleterm.nvim',
    tag = 'v2.*',
    cmd = { "ToggleTerm", "ToggleTermToggleAll" },
    config = function () require("plugins.toggleterm") end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function() require("plugins.gitsigns") end
  }
  use {
    'TimUntersberger/neogit',
    cmd = { "Git", "Neogit" },
    config = function() require("plugins.neogit") end
  }

  -- Language specific plugins
  use {
    'lervag/vimtex',
    ft = { 'tex' },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end) 
