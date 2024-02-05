return {
    "rest-nvim/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    ft = { "http" },
    config = function()
        require("rest-nvim").setup({})
        vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "execute request" })
    end
}
