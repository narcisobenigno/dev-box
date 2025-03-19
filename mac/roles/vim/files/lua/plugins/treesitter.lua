return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
				},
				language = {
					html = {"html", "hbs"},
					javascript = {"javascript", "javascriptreact", "typescript", "typescriptreact", "hbs", "js"},
				},
			})
		end,
	},
}
