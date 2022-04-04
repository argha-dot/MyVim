local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end

lualine.setup {
  options = {
    theme = 'codedark',
    component_separators = {
      left = '│',
      right = '│'
    },
    section_separators = {
      left = '',
      right = ''
      -- left = '█',
      -- right = '█'
    },
    disabled_filetypes = {
      '^NvimTree$',
      '^packer$',
      '^startify$',
      '^fugitive$',
      '^fugitiveblame$',
      '^qf$',
      '^help$',
      '^Neogit',
      '^alpha$'
    }
  },
  sections = {
    lualine_a = {
      {'mode', fmt=trunc(80, 1, nil, true)}
    },
    lualine_b = {
      { 'branch', fmt=trunc(90, 10, 50, true) },
      { 'diff', fmt=trunc(1, 10, 70, true) },
      { 'diagnostics', fmt=trunc(1, 10, 50, true) },
    },
    lualine_c = {
      { 'filename', fmt=trunc(80, 30, nil, true) }
    },
    lualine_x = {
      'fileformat'
    },
    lualine_y = {
      'progress'
    },
    lualine_z = {
      { 'location', fmt=trunc(90, 10, 50, true) },
    }
  },
}
