-- local components = require("nv-plugin.feline.noicon")
local comps = require("nv-plugin.feline.components")


local status_ok, feline = pcall(require, "feline")
if not status_ok then
  return
end

local _components = {
  active = {{}, {}, {}},
  inactive = {{}, {}}
}

table.insert(_components.active[1], comps.vi_mode)
table.insert(_components.active[1], comps.file_info)
table.insert(_components.active[1], comps.git.branch)


table.insert(_components.active[1], comps.git.added)
table.insert(_components.active[1], comps.git.changed)
table.insert(_components.active[1], comps.git.removed)

table.insert(_components.active[3], comps.diagnostics.errors)
table.insert(_components.active[3], comps.diagnostics.warn)
table.insert(_components.active[3], comps.diagnostics.hint)

table.insert(_components.active[3], comps.lsp.name)
table.insert(_components.active[3], comps.file_size)
table.insert(_components.active[3], comps.empty_block)
table.insert(_components.active[3], comps.position)
table.insert(_components.active[3], comps.os)
table.insert(_components.active[3], comps.scroll_bar)


table.insert(_components.inactive[1], comps.file_info)
table.insert(_components.inactive[2], comps.scroll_bar)

feline.setup {
  vi_mode_colors = {
    INSERT = 'magenta',
    -- NORMAL = '',
    -- VISUAL = '',
  },
  force_inactive = {
    filetypes = {
      '^NvimTree$',
      '^packer$',
      '^startify$',
      '^fugitive$',
      '^fugitiveblame$',
      '^qf$',
      '^help$',
      '^Neogit',
      '^alpha$'
    },
    buftypes = {
      '^terminal$',
      '^alpha$'
    },
  },
  components = _components,
}
