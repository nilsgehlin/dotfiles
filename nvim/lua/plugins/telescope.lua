return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>gs", false },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search Grep" },
  },
}
