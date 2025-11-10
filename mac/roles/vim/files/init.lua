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

-- Configure LSP using the new vim.lsp.config API
vim.lsp.config('ts_ls', {
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
})

-- Enable ts_ls automatically
vim.lsp.enable('ts_ls')

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
    if client.name == 'ts_ls' then
      local opts = { buffer = args.buf }
      -- Go to definition
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      -- Show documentation
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      -- Go to references
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      -- Rename symbol
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      -- Code actions
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      -- Show diagnostics
      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
      -- Navigate diagnostics
      vim.keymap.set('n', '<leader>d]', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>d[', vim.diagnostic.goto_prev, opts)
    end
  end,
})

