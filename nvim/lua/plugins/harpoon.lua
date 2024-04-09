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
}
