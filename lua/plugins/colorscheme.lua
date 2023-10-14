function BGTransparent()
  if vim.g.neovide then
    return true
  else
    return true
  end
end

return {
  {
    'EdenEast/nightfox.nvim',
    opts = {
    },
    config = function()
      require("nightfox").setup({
        options = {
          transparent = BGTransparent(),
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic"
          }
        }
      })

      vim.cmd.colorscheme 'carbonfox'
    end
  },
}
