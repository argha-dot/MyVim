local HEIGHT_RATIO = 0.5  -- You can change this
local WIDTH_RATIO = 0.5   -- You can change this too

return {
  "nvim-tree/nvim-tree.lua",
  -- keys = "<C-b>",
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
      'nvim-tree/nvim-web-devicons',
      event = "BufWinEnter"
    },
  },
  opts = {
    view = {
      float = {
        enable = true,

        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()

          local window_w = screen_w * WIDTH_RATIO
          local window_h = screen_h * HEIGHT_RATIO

          local center_x = (screen_w - window_w) / 2
          local center_y = 
            ((vim.opt.lines:get() - window_h) / 2) 
            - vim.opt.cmdheight:get()

          return {
            border = 'rounded',
            relative = 'editor',
            width = math.floor(window_w),
            height = math.floor(window_h),
            row = center_y,
            col = center_x,
          }
        end,
      },
    },
    filters = {
      dotfiles = true,
    },
  }
}
