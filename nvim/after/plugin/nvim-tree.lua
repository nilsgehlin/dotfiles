require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle, { desc = '[P]roject [V]iew' })
vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)
