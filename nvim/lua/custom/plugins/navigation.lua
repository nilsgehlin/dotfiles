return {
    {
        "ThePrimeagen/harpoon",
        config = function()
            vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
            vim.keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu)
            for i = 1, 9 do
                vim.keymap.set("n", "<leader>" .. i, function() require("harpoon.ui").nav_file(i) end)
            end
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree").setup {}
            vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)
        end
    },
    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

}
