require "plugins"

local set = vim.opt

set.compatible = false

vim.cmd "syntax enable"
vim.cmd "filetype plugin on"

vim.g.mapleader = ","

-- Color schema
require('rose-pine').setup({
	variant = 'dawn'
})
vim.cmd.colorscheme("rose-pine")

vim.wo.number = true
vim.wo.relativenumber = true

-- show tralng chars
set.listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<"
set.list = true

-- tabsize
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = false

-- buffer hidden
set.hidden = true

-- Buffers
vim.keymap.set("n", "<leader>b", vim.cmd.Buffers)
vim.keymap.set("n", "<leader>f", vim.cmd.Files)
vim.keymap.set("n", "<leader>g", vim.cmd.GFiles)
vim.keymap.set("n", "<leader>gs", ":GFiles?<CR>")
vim.keymap.set("n", "<leader>/", vim.cmd.Ag)
vim.keymap.set("n", "<leader>h", vim.cmd.History)
vim.keymap.set("n", "<leader>h/", ":History/<CR>")
vim.keymap.set("n", "<leader>h:", ":History:<CR>")

