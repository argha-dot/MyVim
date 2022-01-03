local vi_mode_utils = require('feline.providers.vi_mode')

local function osinfo()
  local os = vim.bo.fileformat:upper()
  local icon
  if os == 'UNIX' then
    icon = ''
  elseif os == 'MAC' then
    icon = ''
  else
    icon = ''
  end
  return icon
end

local M = {
  empty_block = {
    provider = ' ',
    hl = {
      fg = 'oceanblue',
      bg = 'black'
    },
  },

  block = {
    provider = '█',
    hl = {
      fg = 'oceanblue',
    },
  },

  os = {
    provider = osinfo(),
    hl = {
      fg = 'black',
      bg = 'skyblue'
    },
    left_sep = {
      str = " ",
      hl = {
        fg = 'NONE',
        bg = 'skyblue'
      },
    },
    right_sep = {
      str = " ",
      hl = {
        fg = 'NONE',
        bg = 'skyblue'
      },
    }
  }, 
  lsp = {
    name = {
      provider = 'lsp_client_names',
      icon = ' ',
      hl = {
        fg = 'yellow',
        bg = 'black'
      }, 
      left_sep = {
        str = "  ",
        hl = {
          fg = 'NONE',
          bg = 'black'
        },
      },
      right_sep = {
        str = "",
        hl = {
          fg = 'NONE',
          bg = 'black'
        },
      }
    }
  },

  file_size = {
    provider = 'file_size',
    hl = {
      bg = 'black',
    },
    rigt_sep = {
      str = '',
      hl = {
        fg = 'NONE',
        bg = 'black',
      },
    },
    left_sep = {
      {
        str = '  ',
        hl = {
          fg = 'NONE',
          bg = 'black',
        },
      },
    },
  },

  file_info = {
    provider = {
      name = "file_info",
      opts = {
        type = {
          type = 'relative-short',
          file_modified_icon = '●'
        }
      }
    },
    hl = {
      fg = 'white',
      style = 'bold', 
      bg = 'oceanblue'
    },
    right_sep = {
      {
        str = " ",
        hl = {
          fg = "oceanblue",
          bg = "oceanblue"
        }
      },
      {
        str = "",
        hl = {
          fg = "oceanblue",
          bg = "black"
        }
      }
    }, 
    left_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = "oceanblue"
      }
    }
  }, 

  position = {
    provider = 'position',
    hl = {
      bg = 'oceanblue'
    },
    icon = " ", 
    left_sep = {
      {
        str = '',
        hl = {
          fg = 'oceanblue',
          bg = 'black',
        },
      },
      {
        str = ' ',
        hl = {
          bg = 'oceanblue',
          fg = 'black',
        },
      }
    },
    right_sep = {
      {
        str = ' ',
        hl = {
          bg = 'oceanblue',
        },
      },
    },
  },

  scroll_bar = {
    provider = 'scroll_bar',
    hl = {
      fg = 'skyblue',
      bg = 'black',
      style = 'bold',
    },
  }, 

  diagnostics = {
    errors = {
      provider = 'diagnostic_errors',
      hl = {
        fg = 'magenta',
        bg = 'black',
        style = 'bold'
      }
    },
    warn = {
      provider = 'diagnostic_warnings',
      hl = {
        fg = 'yellow',
        bg = 'black',
        style = 'bold'
      }
    },
    hint = {
      provider = 'diagnostic_hints',
      hl = {
        fg = 'cyan',
        bg = 'black',
        style = 'bold'
      }
    }
  }, 

  vi_mode = {
    provider = 'vi_mode',
    hl =  function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        bg = vi_mode_utils.get_mode_color(),
        fg = 'black',
        style = 'bold'
      } 
    end,
    icon = '',
    left_sep = {
      {
        str = ' ',
        hl =  function()
          return {
            bg = vi_mode_utils.get_mode_color(),
          } 
        end,
      },
      ""
    },
    right_sep = {
      {
        str = ' ',
        hl =  function()
          return {
            bg = vi_mode_utils.get_mode_color(),
          } 
        end,
      },
      ""
    }
  }, 
  git = {
    branch = {
      provider = 'git_branch',
      hl = {
        fg = 'white',
        bg = 'black',
        style = 'bold',
      },
      right_sep = {
        {
          str = ' ',
          hl = {
            fg = 'NONE',
            bg = 'black',
          },
        },
        {
          str = 'slant_right_thin',
          hl = {
            fg = 'NONE',
            bg = 'black',
          },
        },
      },
      left_sep = {
        str = ' ',
        hl = {
          fg = 'NONE',
          bg = 'black',
        },
      },
    },
    added = {
      provider = 'git_diff_added',
      hl = {
        fg = 'green',
        bg = 'black',
      },
      icon = "  "
    },
    changed = {
      provider = 'git_diff_changed',
      hl = {
        fg = 'orange',
        bg = 'black',
        style = 'bold'
      },
      icon = "  "
    },
    removed = {
      provider = 'git_diff_removed',
      hl = {
        fg = 'magenta',
        bg = 'black',
        style = 'bold'
      },
      right_sep = {
        {
          str = " ",
          hl = {
            fg = "NONE",
            bg = "black"
          }
        },
        {
          str = ' ',
          hl = {
            fg = 'NONE',
            bg = 'black',
          },
        }
      },
      icon = "  "
    },
  }
}

return M
