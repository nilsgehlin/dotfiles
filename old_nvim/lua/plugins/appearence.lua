return {
    {
        -- Theme
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('kanagawa').setup({
                colors = { -- add/modify theme and palette colors
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    },
                }
            })

            vim.cmd.colorscheme 'kanagawa'
        end,
    },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1
                    }
                }
            }
        },
    }
}
