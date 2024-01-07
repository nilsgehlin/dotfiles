local on_attach = function(server_name)
    return function(_, bufnr)
        local format_cmd
        if (server_name == "fsautocomplete") then
            format_cmd = "<cmd>silent !fantomas %<CR>"
        else
            format_cmd = vim.lsp.buf.format
        end

        vim.keymap.set('n', '<leader>f', format_cmd)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
        vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions)
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
        vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations)
        vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
    end
end

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
            { 'folke/neodev.nvim', opts = {} }
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup()

            -- Bicep
            vim.cmd [[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]]
            require 'lspconfig'.bicep.setup {
                cmd = { "dotnet", "/home/nige/projects/external/bicep/src/Bicep.LangServer/bin/Debug/net7.0/Bicep.LangServer.dll" },
            }

            local capabilities = vim.tbl_deep_extend("force",
                vim.lsp.protocol.make_client_capabilities(),
                require('cmp_nvim_lsp').default_capabilities()
            )
            capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

            require("roslyn").setup({
                roslyn_version = "4.9.0-2.23563.2",
                on_attach = on_attach("roslyn"),
                capabilities = capabilities,
            })

            local servers = {
                tsserver = {},
                marksman = {},
                lua_ls = {},
            }

            local mason_lspconfig = require 'mason-lspconfig'
            mason_lspconfig.setup {
                ensure_installed = vim.tbl_keys(servers),
            }

            mason_lspconfig.setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach(server_name),
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                    }
                end,
            }

            -- nvim-cmp
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            require('luasnip.loaders.from_vscode').lazy_load()
            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete {},
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
            }
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'jmederosalvarado/roslyn.nvim',
    },
    {
        'ionide/Ionide-vim',
    }

}
