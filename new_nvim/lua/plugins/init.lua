return {
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
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>e",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
    },
    {
        "folke/zen-mode.nvim",
        opts = {},
        cmd = { "ZenMode" },
        keys = {
            { "<leader>zz", "<CMD>ZenMode<CR>" },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        'windwp/nvim-ts-autotag',
        ft = {
            'html',
            'javascriptreact',
            'typescriptreact',
            'svelte',
            'vue',
            'tsx',
            'jsx',
            'markdown',
            'handlebars',
            'hbs',
        },
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            user_default_options = {
                names = false,   -- "Name" codes like Blue or blue
                tailwind = true, -- Enable tailwind colors
            },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
    },
}
