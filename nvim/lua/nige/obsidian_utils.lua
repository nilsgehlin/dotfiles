local M = {}

M.new_note = function()
    local name = vim.fn.input('Note name: ')
    local cmd = "ObsidianNew " .. name
    vim.cmd(cmd)
end

return M
