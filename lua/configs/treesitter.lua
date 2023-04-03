require('nvim-treesitter.configs').setup {
  ensure_installed = {"c", "lua", "rust", "html", "json", "json5", "latex", "markdown",
    "python", "regex", "scss", "tsx", "typescript", "vim", "yaml", "toml", "css", "cpp",
    "dockerfile", "cmake", "go", "make", "markdown_inline", "go", "gomod"
  },
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  rainbow = {
    enable = true,
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  },
  autotag = {
    enable = true,
  }
}
