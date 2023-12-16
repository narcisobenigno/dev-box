require "plugins"

local set = vim.opt
local keymap = vim.keymap

set.compatible = false

vim.cmd "syntax enable"
vim.cmd "filetype plugin on"

vim.g.mapleader = ","
set.swapfile = false

vim.wo.number = true
vim.wo.relativenumber = true

-- tabsize
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = false

-- buffer hidden
set.hidden = true

-- Buffers
keymap.set("n", "<leader>b", vim.cmd.Buffers)
keymap.set("n", "<leader>f", vim.cmd.Files)
keymap.set("n", "<leader>g", vim.cmd.GFiles)
keymap.set("n", "<leader>gs", ":GFiles?<CR>")
keymap.set("n", "<leader>/", vim.cmd.Ag)
keymap.set("n", "<leader>h", vim.cmd.History)
keymap.set("n", "<leader>h/", ":History/<CR>")
keymap.set("n", "<leader>h:", ":History:<CR>")

keymap.set("n", "<leader><leader>", ":e $MYVIMRC<CR>")

-- Replace selected text
keymap.set("n", "<C-r>", "hy:%s/<C-r>h//gc<left><left><left>", {silent = true})

-- Tree
keymap.set("n", "<leader>t", vim.cmd.Oil, { desc = "File tree" })

-- Color schema
require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { 
		'bash',
		'diff',
		'dockerfile',
		'git_rebase',
		'git_rebase',
		'gitattributes',
		'gitcommit',
		'gitignore',
		'go',
		'gomod',
		'html',
		'javascript',
		'json',
		'lua',
		'make',
		'markdown',
		'markdown_inline',
		'query',
		'regex',
		'rust',
		'terraform',
		'vim',
		'vimdoc',
		'yaml',
	},
	sync_install = false,
	auto_install = true,


	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
}

require('oil').setup() 

