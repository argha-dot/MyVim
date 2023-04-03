return {
  'nvim-treesitter/nvim-treesitter',
  -- enabled = false,
  dependencies = {
    'HiPhish/nvim-ts-rainbow2',
    'windwp/nvim-ts-autotag',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  -- config = function()
  --   pcall(require('nvim-treesitter.install').update { with_sync = true })
  -- end,
  build = ":TSUpdate"
}
