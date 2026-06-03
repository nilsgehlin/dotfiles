-- Enable module caching for faster require() calls
vim.loader.enable()

-- Disable unused built-in plugins for faster startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_man = 1

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
