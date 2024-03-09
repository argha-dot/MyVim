-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local HEIGHT_RATIO = 0.5  -- You can change this
local WIDTH_RATIO = 0.5   -- You can change this too

-- global
vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function edit_or_open()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      -- expand or collapse folder
      api.node.open.edit()
    else
      -- open file
      api.node.open.edit()
      -- Close the tree if file was opened
      api.tree.close()
    end
  end

  -- open as vsplit on current node
  local function vsplit_preview()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      -- expand or collapse folder
      api.node.open.edit()
    else
      -- open file as vsplit
      api.node.open.vertical()
    end

    -- Finally refocus on tree if it was lost
    api.tree.focus()
  end

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'l', edit_or_open, opts('Up'))
  vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
  vim.keymap.set("n", "h", api.tree.close, opts("Close"))
  vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
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
    on_attach = on_attach
  }
}
