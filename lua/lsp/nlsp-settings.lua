local status_ok, nlspsettings = pcall(require, "nlspsettings")

nlspsettings.setup({
  config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
  local_settings_root_markers = { '.git' },
})
