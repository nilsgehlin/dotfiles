return {
    {
        -- Theme
        'Mofiqul/vscode.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'vscode'
        end,
    },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'gruvbox',
                component_separators = '|',
                section_separators = '',
            },
        },
    }
}
