require('Comment').setup({
  pre_hook = function(ctx)
      -- Only calculate commentstring for tsx filetypes
      if vim.bo.filetype == 'typescriptreact' then
          local U = require('Comment.utils')

          -- Detemine whether to use linewise or blockwise commentstring
          local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

          -- Determine the location where to calculate commentstring from
          local location = nil
          if ctx.ctype == U.ctype.block then
              location = require('ts_context_commentstring.utils').get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
              location = require('ts_context_commentstring.utils').get_visual_start_location()
          end

          return require('ts_context_commentstring.internal').calculate_commentstring({
              key = type,
              location = location,
          })
      end
  end,
  toggler = {
    -- line = '<leader>cc',
    -- block = '<leader>bc',
  },
  opleader = {
    -- Line-comment keymap
    --     line = 'gc',
    -- Block-comment keymap
    --     block = 'gb',
  },
  extra = {
    ---Add comment on the line above
    above = '<leader>cO',
    ---Add comment on the line below
    below = '<leader>co',
    ---Add comment at the end of line
    eol = '<leader>cA',
  },
})

