return {
  'tpope/vim-sleuth',
  {
    'unblevable/quick-scope',
    config = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    end
  }
}
