return {
    -- Git related plugins
    {
        'tpope/vim-fugitive',
        keys = {
            { "<leader>gs", "<CMD>Git<CR>", desc = "Open Fugitive" },
            { "<leader>gp", "<CMD>Git push<CR>", desc = "Open Fugitive" },
        },

    },
    'tpope/vim-rhubarb',

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>t", vim.cmd.TroubleToggle, desc = "Toggle Trouble" },
        },
    },
}
