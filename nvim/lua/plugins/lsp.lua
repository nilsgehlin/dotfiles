local on_attach = function(server_name)
    return function(client, bufnr)
        local utils = require('utils')

        client.server_capabilities.semanticTokensProvider = nil

        local format_cmd = vim.lsp.buf.format
        local prettierFiletypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
        for _, prettierFiletype in ipairs(prettierFiletypes) do
            if (vim.bo[bufnr].filetype == prettierFiletype) then
                format_cmd = utils.run_prettierd
                break
            end
        end
        utils.map('<leader>f', format_cmd)

        local ts = require('telescope.builtin')
        utils.map('gd', ts.lsp_definitions)
        utils.map('gr', ts.lsp_references)
        utils.map('gI', ts.lsp_implementations)
        utils.map('<leader>ds', ts.lsp_document_symbols)
        utils.map('<leader>ws', ts.lsp_workspace_symbols)
        utils.map('<leader>rn', vim.lsp.buf.rename)
        utils.map('<leader>ca', vim.lsp.buf.code_action, { "n", "x", "v" })
        utils.map('K', vim.lsp.buf.hover)
        utils.map('<C-k>', vim.lsp.buf.signature_help)
    end
end

return {
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'jmederosalvarado/roslyn.nvim',
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
            { 'folke/neodev.nvim', opts = {} }
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup()

            local capabilities = vim.tbl_deep_extend("force",
                vim.lsp.protocol.make_client_capabilities(),
                require('cmp_nvim_lsp').default_capabilities()
            )

            require("roslyn").setup({
                on_attach = on_attach("roslyn"),
                capabilities = capabilities,
            })

            local mason_lspconfig = require('mason-lspconfig')
            mason_lspconfig.setup {
                ensure_installed = {
                    "bashls",
                    "bicep",
                    "cssls",
                    "eslint",
                    "html",
                    "jsonls",
                    "lemminx",
                    "lua_ls",
                    "marksman",
                    "tailwindcss",
                }
            }


            mason_lspconfig.setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach(server_name),
                        settings = {},
                        root_dir = function(_, _) return vim.fn.getcwd() end
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
                experimental = {
                    ghost_text = true,
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete {},
                    ['<C-y>'] = cmp.mapping.confirm {
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
                    { name = "luasnip",               max_item_count = 5,  group_index = 1 },
                    { name = "nvim_lsp",              max_item_count = 20, group_index = 1 },
                    { name = "nvim_lua",              group_index = 1 },
                    { name = "vim-dadbod-completion", group_index = 1 },
                    { name = "path",                  group_index = 2 },
                    { name = "buffer",                keyword_length = 2,  max_item_count = 5, group_index = 2 },
                    -- { name = 'copilot',               group_index = 1,     priority = 100, }
                },
            }

            local lspconfig = require('lspconfig')
            lspconfig.eslint.setup {
                -- Server-specific settings. See `:help lspconfig-setup`
                settings = {
                    workingDirectory = {
                        mode = "location"
                    }
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
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
            settings = {
                expose_as_code_action = "all",
                tsserver_max_memory = 8092,
                separate_diagnostic_server = false,
            }
        },
    }
}
