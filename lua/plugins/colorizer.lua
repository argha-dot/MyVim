return {
  'norcalli/nvim-colorizer.lua',
  ft = { 'html','css','sass','vim','typescript','typescriptreact'},
  config = function()
    require 'colorizer'.setup {
      "*"
    }
  end,
}
