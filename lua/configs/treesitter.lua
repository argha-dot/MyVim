require('nvim-treesitter.configs').setup {
  ensure_installed = {"c", "lua", "rust", "html", "json", "json5", "latex",
    "markdown", "python", "regex", "scss", "tsx", "typescript", "vim", "yaml",
    "toml", "css", "cpp", "dockerfile", "cmake", "go", "make",
    "markdown_inline", "go", "gomod"
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
  contenxt_ommentstring = {
    enable = true,
    enable_autocmd = false
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobject
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.inner',
        ['if'] = '@function.inner',
        ['ac'] = '@class.inner',
        ['ic'] = '@class.inner',
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- Whether to set jumps in the jumplist,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer'
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer'
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer'
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer'
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_prev = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}
