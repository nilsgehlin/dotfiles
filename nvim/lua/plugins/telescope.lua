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
            local ts = require('telescope.builtin')
            local map = require('utils').map

            local rg_args = { additional_args = { '--hidden', '-g', '!.git' } }
            map('<leader>sw', function() ts.grep_string(rg_args) end)
            map('<leader>sg', function() ts.live_grep(rg_args) end)
            map('<leader>b', ts.buffers)
            map('<leader>sf', ts.git_files)
            map('<leader>sh', ts.help_tags)
            map('<leader>sm', ts.man_pages)
        end
    },

}
