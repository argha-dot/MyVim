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
  opts = {
  }
}
