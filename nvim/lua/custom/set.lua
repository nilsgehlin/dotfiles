-- [[ Setting options ]]
--- See `:help vim.o`

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indent stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Scrolling offset
vim.opt.scrolloff = 8

-- Turn off text wrapping
vim.opt.wrap = false

-- Turn off highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Turn on relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'no'

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme vscode]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
