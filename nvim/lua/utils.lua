local M = {}

---@param lhs string
---@param rhs string | function
---@param mode string?
M.map = function(lhs, rhs, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, lhs, rhs)
end

return M
