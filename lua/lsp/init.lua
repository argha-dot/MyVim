local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "lsp.null-ls"
require 'lsp.lsp-installer'
-- require 'lsp.config'
require('lsp.handlers').setup()
