return {
  'glepnir/lspsaga.nvim',
  event = "LspAttach",
  config = function()
    require("lspsaga").setup {
      ui = {
        title = false,
        border = "single"
      },
      symbol_in_winbar = {
        enable = false,
        separator = "  ",
        folder_level = 1
      }
    }
  end,
  -- dependencies = {
  --   { "nvim-tree/nvim-web-devicons" },
  --   { "nvim-treesitter/nvim-treesitter" }
  -- }
}
