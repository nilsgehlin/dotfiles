return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>gs", false },
  },
  opts = {
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        additional_args = function(_)
          return { "--hidden", "-g", "!.git" }
        end,
      },
    },
  },
}
