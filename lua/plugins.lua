local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok_lazy, lazy = pcall(require, "lazy")
if not status_ok_lazy then return end

lazy.setup({
 'lewis6991/impatient.nvim',
  --'nathom/filetype.nvim',

  -- Telescope
 'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', version = '0.1.0' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- TreeSitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require("plugins.treesitter") end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
      'p00f/nvim-ts-rainbow'
    }
  },
  -- { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter', },
  -- { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter', },
  -- { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter', },

  -- File Tree
  {
    'kyazdani42/nvim-tree.lua',
    keys = "<C-b>",
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
  },

  -- Visual Stuff
  {
    'kyazdani42/nvim-web-devicons',
    event = "BufWinEnter"
  },
  {
    'goolord/alpha-nvim',
    cmd = {
      "Alpha",
      "AlphaRedrwa"
    },
    event = "BufWinEnter",
    config = function() require("plugins.alpha") end
  },
  --'christianchiarulli/nvcode-color-schemes.vim',
  --'rebelot/kanagawa.nvim',
 'tiagovla/tokyodark.nvim',
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufRead", "BufNewFile", "BufWinEnter" },
    config = function() require("plugins.indent-line") end
  },
  {
    'norcalli/nvim-colorizer.lua',
    ft = { 'html','css','sass','vim','typescript','typescriptreact'},
    config = function() require("plugins.colorizer") end
  },

  -- Lines
  {
    'nvim-lualine/lualine.nvim',
    config = function() require("plugins.lualine") end
  },

  -- Editing
  {
    'numToStr/Comment.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function() require("plugins.comment") end
  },
  {
    'tpope/vim-repeat',
    event = { "BufRead", "BufNewFile" },
  },
  {
    'tpope/vim-surround',
    event = { "BufRead", "BufNewFile" },
  },
  {
    'folke/which-key.nvim',
    keys = { "<Leader>", "'", '"', 'z' },
    config = function() require("plugins.which-key") end
  },
  -- {
  --   'unblevable/quick-scope',
  --   config = function() require("plugins.quick-scope") end
  -- },
  {
    'andymass/vim-matchup',
    config = function() require("plugins.matchup") end
  },

  -- CMP
 'hrsh7th/nvim-cmp', -- The completion plugin
 'hrsh7th/cmp-nvim-lsp',
 'hrsh7th/cmp-buffer', -- buffer completions
 'hrsh7th/cmp-path', -- path completions
 'hrsh7th/cmp-cmdline', -- cmdline completions
 'saadparwaiz1/cmp_luasnip', -- snippet completions
 'jcha0713/cmp-tw2css',

  -- Snippets
 'L3MON4D3/LuaSnip', --snippet engine
 'rafamadriz/friendly-snippets', -- a bunch of snippets to use
  {
    'mattn/emmet-vim',
    event = { "InsertEnter" },
    config = function() require("plugins.emmet") end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function() require("plugins.autopairs") end
  },

  -- LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    'neovim/nvim-lspconfig',
    config =  function() require("lsp") end
  }, -- enable LSP,
  {
    'kkharji/lspsaga.nvim',
    config = function() require("lspsaga") end
  },

  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    keys = {
      [[<C-\>]],
    },
    version = 'v2.*',
    cmd = { "ToggleTerm", "ToggleTermToggleAll" },
    config = function() require("plugins.toggleterm") end
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function() require('plugins.gitsigns') end
  },
  {
    'TimUntersberger/neogit',
    -- 'ten3roberts/neogit',
    cmd = { "Git", "Neogit" },
    config = function() require('plugins.neogit') end
  },

  -- Language specific plugins
  {
    'lervag/vimtex',
    ft = { 'tex' },
    config = function() require("plugins.vimtex") end
  },
  {
    'jbyuki/nabla.nvim',
    ft = { 'tex', 'md' },
    config = function() require("plugins.nabla") end
  },
})
