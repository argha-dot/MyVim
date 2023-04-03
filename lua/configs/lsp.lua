-- Diagnostic keymaps
vim.keymap.set('n', '[d',        "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d',        "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', "<cmd> Lspsaga rename<CR>", '[R]e[n]ame')
  nmap('<leader>ca', "<cmd> Lspsaga code_action<CR>", '[C]ode [A]ction')
  nmap('gd',         vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gD',         vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D',  vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('gr',         require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('K',          "<cmd> Lspsaga hover_doc<CR>", 'Hover Documentation')
  nmap('<C-k>',      vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  tsserver = {},
  pyright = {},
  html = {},
  cssls = {},
  cssmodules_ls = {},
  emmet_ls = {},
  rust_analyzer = {},
  tailwindcss = {},
  texlab = {},
  jsonls = {},
  gopls = {}
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("mason").setup()

local mason_lspconfig = require "mason-lspconfig"

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name]
    }
  end,
}

