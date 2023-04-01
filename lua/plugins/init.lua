return {
  'tpope/vim-sleuth',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  {
    'unblevable/quick-scope',
    lazy = false,
    init = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    end
  }
}
