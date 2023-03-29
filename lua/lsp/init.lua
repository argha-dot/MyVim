local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then return end

local stat_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not stat_ok then return end

-- local stat, lsp_util = pcall(require, "lspconfig/util")
-- if not stat then return end

local servers = { "tsserver", "pyright", "html", "cssls", "cssmodules_ls",
  "emmet_ls", "rust_analyzer", "tailwindcss", "texlab", "jsonls", "gopls"
}

local function on_attach(_, bufnr)
  -- client.resolved_capabilities.document_formatting = false

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>         lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>         lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>         lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>  Lspsaga lsp_finder<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>          Lspsaga hover_doc <CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-n>", "<cmd>      Lspsaga signature_help<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd> Lspsaga  rename<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>         Lspsaga diagnostic_jump_prev<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>         Lspsaga diagnostic_jump_next<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd> Lspsaga code_action <CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>         Lspsaga preview_definition<CR>", opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      python = {
        venvPath = ".",
        venv = "venv",
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        },
      },
    }
  })
end
