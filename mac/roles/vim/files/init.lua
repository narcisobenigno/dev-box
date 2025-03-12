local set = vim.opt
local keymap = vim.keymap
local autocmd = vim.api.nvim_create_autocmd

set.compatible = false

vim.cmd "syntax enable"
vim.cmd "filetype plugin on"

vim.g.mapleader = ","
set.swapfile = false

vim.wo.number = true
vim.wo.relativenumber = true

autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- tabsize
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = false

-- buffer hidden
set.hidden = true

set.listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<"
set.list = true

require "config.lazy"

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
		'typescript',
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

require('oil').setup({
	view_options = {
		show_hidden = true,
	},
})

-- Configure LSP
local lspconfig = require('lspconfig')

-- Start tsserver (ts_ls) for TypeScript/JavaScript
lspconfig.ts_ls.setup({
	cmd = { 'typescript-language-server', '--stdio' }, -- Explicitly set the command
	on_attach = function(client, bufnr)
		-- Keybindings for LSP features
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to definition
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Show documentation
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Rename symbol
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
		vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- Show diagnostics
	end,
})

-- Autocompletion (nvim-cmp)
local cmp = require('cmp')
cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- LSP completions
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})

-- Keymaps for LSP actions
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == 'tsserver' then
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = true })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = true })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = true })
      vim.keymap.set('n', '<leader>d]', vim.lsp.diagnostic.goto_next, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>d[', vim.lsp.diagnostic.goto_previous, { noremap = true, silent = true })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = true })
    end
  end,
})

