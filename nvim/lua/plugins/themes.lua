return {
  {
    -- Theme
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        colors = { -- add/modify theme and palette colors
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })

      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
