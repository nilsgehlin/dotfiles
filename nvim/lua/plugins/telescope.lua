return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>gs", false },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search Grep" },
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
