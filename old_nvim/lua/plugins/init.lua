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
    'tpope/vim-sleuth',
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>e",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            -- {
            --     "<leader>xX",
            --     "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            --     desc = "Buffer Diagnostics (Trouble)",
            -- },
            -- {
            --     "<leader>cs",
            --     "<cmd>Trouble symbols toggle focus=false<cr>",
            --     desc = "Symbols (Trouble)",
            -- },
            -- {
            --     "<leader>cl",
            --     "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            --     desc = "LSP Definitions / references / ... (Trouble)",
            -- },
            -- {
            --     "<leader>xL",
            --     "<cmd>Trouble loclist toggle<cr>",
            --     desc = "Location List (Trouble)",
            -- },
            -- {
            --     "<leader>xQ",
            --     "<cmd>Trouble qflist toggle<cr>",
            --     desc = "Quickfix List (Trouble)",
            -- },
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
        'NvChad/nvim-colorizer.lua',
        opts = {
            user_default_options = {
                names = false,   -- "Name" codes like Blue or blue
                tailwind = true, -- Enable tailwind colors
            },
        },

    },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     ft = { "yaml" },
    --     opts = {
    --         indent = {
    --             char = "|",
    --         },
    --     },
    -- }
}
