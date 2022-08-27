
local servers = {
  "tsserver", "pyright", "html", "cssls", "cssmodules_ls",
  "emmet_ls", "rust_analyzer", "tailwindcss"
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = false,
})
