local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}


require'nvim-tree'.setup {
  auto_reload_on_write = false,
  disable_netrw       = true,
  hide_root_folder = false,
  hijack_cursor       = false,
  hijack_netrw        = true,
  open_on_setup       = false,
  open_on_tab         = false,
  update_cwd          = false,
  view = {
    width = 30,
    height = 30,
    side = 'left',
    preserve_window_proportions = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "<S-v>", cb = tree_cb("vsplit")}
      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  ignore_ft_on_setup  = {
    "startify",
    "dashboard",
    "alpha"
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = false,
    -- enable = true,
    ignore = true,
    timeout = 800,
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
}

vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.cmd [[
  augroup AutoClose
    autocmd!
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end
]]
