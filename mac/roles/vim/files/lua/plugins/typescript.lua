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
}
