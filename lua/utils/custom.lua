local M = {}

function M.SideToggle()
    if (require'nvim-tree.view'.win_open()) then
        require'bufferline.state'.set_offset(0)
    else
        require'bufferline.state'.set_offset(31, '')
    end
    require'nvim-tree'.toggle()
end

return M

