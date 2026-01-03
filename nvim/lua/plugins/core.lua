return {
  {
    -- Theme
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      colors = { -- add/modify theme and palette colors
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
