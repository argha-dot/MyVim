return {
  'ray-x/lsp_signature.nvim',
  config = function()
    -- code
    require "lsp_signature".setup {
      floating_window = true,
      hint_enable = false,
      hint_prefix = "",
    }
  end
}
