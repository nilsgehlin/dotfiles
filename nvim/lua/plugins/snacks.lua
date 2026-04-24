return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = { enabled = false },
      picker = {
        formatters = {
          file = {
            filename_first = true, -- display filename before the file path
            --- * left: truncate the beginning of the path
            --- * center: truncate the middle of the path
            --- * right: truncate the end of the path
            ---@type "left"|"center"|"right"
            truncate = "right",
          },
        },
      },
    },
    keys = {
      { "<leader>gs", false },
    },
  },
}
