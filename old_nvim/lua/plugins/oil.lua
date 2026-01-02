return {
    {
        'stevearc/oil.nvim',
        opts = {},
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
        },
    },
}
