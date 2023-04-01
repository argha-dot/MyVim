return {
  "kyazdani42/nvim-tree.lua",
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
  dependencies = {
    {
      'kyazdani42/nvim-web-devicons',
      event = "BufWinEnter"
    },
  },
  config = function()
    require("nvim-tree").setup {
      disable_netrw = true,
    }
    vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
    vim.cmd [[
      augroup AutoClose
        autocmd!
        autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
      augroup end
    ]]
  end
}
