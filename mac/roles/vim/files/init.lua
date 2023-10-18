require "plugins"

local set = vim.opt

vim.cmd "set nocompatible"

vim.cmd "syntax enable"
vim.cmd "filetype plugin on"

vim.cmd 'let mapleader=","'
vim.cmd.colorscheme("delek")

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd "set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<"
vim.cmd "set list"

-- tabsize
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = false

-- Buffers
vim.keymap.set("n", "<leader>b", vim.cmd.Buffers)
vim.keymap.set("n", "<leader>f", vim.cmd.Files)

