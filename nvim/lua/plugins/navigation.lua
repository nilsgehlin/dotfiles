return {
    {
        'stevearc/oil.nvim',
        opts = {},
        lazy = false,
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
        },
    },
}
