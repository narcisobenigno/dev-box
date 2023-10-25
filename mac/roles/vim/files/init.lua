require "plugins"

local set = vim.opt

set.compatible = false

vim.cmd "syntax enable"
vim.cmd "filetype plugin on"

vim.g.mapleader = ","
set.swapfile = false

-- Color schema
require'nvim-treesitter.configs'.setup {
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

vim.wo.number = true
vim.wo.relativenumber = true

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

