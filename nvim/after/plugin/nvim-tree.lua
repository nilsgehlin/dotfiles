local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    -- local function opts(desc)
    --   return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    -- end
    --
    -- -- copy default mappings here from defaults in next section
    -- vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
    -- vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
    ---
    -- OR use all default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- remove a default
    vim.keymap.del('n', '<C-e>', { buffer = bufnr })
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  on_attach = my_on_attach,
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle, { desc = '[P]roject [V]iew' })
vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)
