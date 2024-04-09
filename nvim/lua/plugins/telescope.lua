return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
            pcall(require('telescope').load_extension, 'fzf')
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>b', builtin.buffers)
            vim.keymap.set('n', '<leader>sf', builtin.git_files)
            vim.keymap.set('n', '<leader>sh', builtin.help_tags)
            vim.keymap.set('n', '<leader>sw',
                function() builtin.grep_string({ additional_args = { '--hidden', '-g', '!.git' } }) end)
            vim.keymap.set('n', '<leader>sg',
                function() builtin.live_grep({ additional_args = { '--hidden', '-g', '!.git' } }) end)
            vim.keymap.set('n', '<leader>sm', builtin.man_pages)
        end
    },

}
