return {
	-- TypeScript LSP
	{
		'pmizio/typescript-tools.nvim', -- Better TS support (optional but recommended)
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {},
	},

	-- Treesitter (syntax highlighting)
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = { 'typescript', 'javascript', 'tsx' },
				highlight = { enable = true },
			})
		end,
	},

	-- Optional: Formatting (Prettier)
	{
		'jose-elias-alvarez/null-ls.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local null_ls = require('null-ls')
			null_ls.setup({
				sources = { null_ls.builtins.formatting.prettier }, -- Add other tools as needed
			})
		end,
	},
}
