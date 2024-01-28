return {
    -- Git related plugins
    {
        'tpope/vim-fugitive',
        cmd = { "Git" },
        keys = {
            { "<leader>gs", "<CMD>Git<CR>",      desc = "Open Fugitive" },
            { "<leader>gp", "<CMD>Git push<CR>", desc = "Open Fugitive" },
        },

    },
    'tpope/vim-rhubarb',

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>e", vim.cmd.TroubleToggle, desc = "Toggle Trouble" },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        keys = {
            { "<leader>mp", "<CMD>MarkdownPreviewToggle<CR>", desc = "[M]arkdown [P]review" },
        },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "folke/zen-mode.nvim",
        opts = {},
        cmd = { "ZenMode" },
        keys = {
            { "<leader>zz", "<CMD>ZenMode<CR>"},
        },
    },
}
