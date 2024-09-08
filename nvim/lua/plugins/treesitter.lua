return {
    'nvim-treesitter/nvim-treesitter',

    opts = {
        ensure_installed = {
            'bash',
            'bicep',
            'c_sharp',
            'css',
            'html',
            'http',
            'javascript',
            'json',
            'lua',
            'markdown',
            'markdown_inline',
            'typescript',
            'tsx',
            'vim',
            'vimdoc',
            'xml'
        },

        autotag = {
            enable = true,
        },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,

        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
                if added[lang] then
                    return false
                end
                added[lang] = true
                return true
            end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)
        vim.keymap.set('n', '<C-n>',
            function()
                require("nvim-treesitter.textobjects.move").goto_next_start('@function.outer'); vim.api.nvim_feedkeys(
                    "zz", "n", false)
            end)
        vim.keymap.set('n', '<C-p>',
            function()
                require("nvim-treesitter.textobjects.move").goto_previous_start('@function.outer'); vim.api
                    .nvim_feedkeys("zz", "n", false)
            end)
    end,

    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
}
