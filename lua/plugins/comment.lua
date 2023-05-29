return {
  'numToStr/Comment.nvim',
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("Comment").setup {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),

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
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
      },
    }
  end,
}
