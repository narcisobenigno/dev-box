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
require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { 
		'javascript',
		'lua',
		'vim',
		'vimdoc',
		'query',
		'rust',
		'json',
		'yaml',
		'gitcommit',
		'git_rebase',
		'diff',
	},
	sync_install = false,
	auto_install = true,


	highlight = {
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

