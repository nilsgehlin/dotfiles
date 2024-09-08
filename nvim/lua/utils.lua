local M = {}

---@param lhs string
---@param rhs string | function
---@param mode string[]?
M.map = function(lhs, rhs, mode)
    mode = mode or { 'n' }
    vim.keymap.set(mode, lhs, rhs)
end

M.run_prettierd = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local bufferContent = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')

    vim.system({ 'prettierd', vim.fn.expand('%') },
        { text = true, cwd = vim.fn.getcwd(), stdin = bufferContent },
        function(out)
            if (out.code == 0) then
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(0, 0, -1, false,
                        vim.split(out.stdout, '\n'))
                end)
                vim.schedule(function() vim.api.nvim_win_set_cursor(0, { row, col }) end)
            end
        end)
end

return M
