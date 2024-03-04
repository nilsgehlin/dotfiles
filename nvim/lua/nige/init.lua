vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Indenting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Enable concealing, used in Obisidan
-- vim.opt.conceallevel = 3

vim.o.hlsearch = false

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

vim.o.mouse = 'a'

vim.o.clipboard = 'unnamedplus'

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

-- [[ Keymaps ]]

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ 'n', 'v' }, '<C-f>', '<Nop>', { silent = true })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "<leader>pv", function() require("oil").open(vim.fn.getcwd()) end)

vim.keymap.set("n", "<leader>df", function()
    local answer = vim.fn.input('Delete current file? y/n: ')
    if answer == "y" then
        vim.cmd("call delete(expand('%')) | bdelete!")
    end
end)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

vim.opt.concealcursor = 'nvic'

-- Concel \r in files with mixed line endings
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    command = "syn match CR /\r$/ conceal"
})
