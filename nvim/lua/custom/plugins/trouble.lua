return {
      'folke/trouble.nvim',
      keys = {
        { '<leader>e', vim.cmd.TroubleToggle, mode = "n", desc = "Show errors" }
      },
    },
    {
      'ray-x/lsp_signature.nvim',
      opts = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded",
        }
      }
    }
