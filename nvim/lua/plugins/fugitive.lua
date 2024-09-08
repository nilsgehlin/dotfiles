return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    keys = {
      { "<leader>gs", "<CMD>above Git<CR>", desc = "Open Fugitive" },
      { "<leader>gp", "<CMD>Git push<CR>", desc = "Open Fugitive" },
    },
  },
}
