return {
  -- Theme inspired by Atom
  'Mofiqul/vscode.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'vscode'
  end,
  opts = {
    transparent = true,
    italic_comments = true,
    disable_nvimtree_bg = true,
    color_overrides = {
      vscLineNumber = '#FFFFFF',
    },
  }
}
