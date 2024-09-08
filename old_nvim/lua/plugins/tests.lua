return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "Issafalcon/neotest-dotnet",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-dotnet")
                }
            })
        end,
        keys = {
            { "<leader>tn", function() require("neotest").run.run() end,                     desc = "[T]est [N]earest" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = "[T]est [F]ile" },
            { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "[T]est [D]ebug" },
            { "<leader>to", "Neotest output",                                                desc = "[T]est [O]utput" },
        },
    }
}
