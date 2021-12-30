require('Comment').setup({
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

