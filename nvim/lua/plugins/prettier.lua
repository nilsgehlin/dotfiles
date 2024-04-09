return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = {},
    },
    {
        "MunifTanjim/prettier.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
            bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
            filetypes = {
                "css",
                "graphql",
                "html",
                "javascript",
                "javascriptreact",
                "json",
                "less",
                "markdown",
                "scss",
                "typescript",
                "typescriptreact",
                "yaml",
            },
            ["null-ls"] = {
                condition = function()
                    return require("prettier").config_exists({
                        check_package_json = true,
                    })
                end,
            }
        },
    },
}
