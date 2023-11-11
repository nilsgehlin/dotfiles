return {
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = { "lua", "c_sharp" }
        },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/playground',
        },
        build = ':TSUpdate',
    }
}
