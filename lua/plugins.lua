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
  -- use 'nathom/filetype.nvim'

  -- Telescope
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

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
  use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter', }

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
  -- use 'christianchiarulli/nvcode-color-schemes.vim'
  -- use 'rebelot/kanagawa.nvim'
  use 'tiagovla/tokyodark.nvim'

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

  -- LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use {
    'neovim/nvim-lspconfig',
    config =  function () require("lsp") end
  } -- enable LSP
  use { 
    'kkharji/lspsaga.nvim',
    config = function() require("lspsaga") end
  }

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
    config = function() require("plugins.vimtex") end
  }
  use {
    'jbyuki/nabla.nvim',
    ft = { 'tex', 'md' },
    config = function() require("plugins.nabla") end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end) 
