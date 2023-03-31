return { -- Theme inspired by Atom
  'tiagovla/tokyodark.nvim',
  priority = 1000,
  config = function()
    vim.g.tokyodark_transparent_background = true
    vim.g.tokyodark_enable_italic_comment = true
    vim.g.tokyodark_enable_italic = false

    vim.cmd.colorscheme 'tokyodark'

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
