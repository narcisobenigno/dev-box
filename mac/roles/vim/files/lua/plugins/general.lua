return {
	-- LSP & Autocompletion
	{ 'neovim/nvim-lspconfig' }, -- Base LSP setup
	{ 'hrsh7th/nvim-cmp' },      -- Autocompletion engine
	{ 'hrsh7th/cmp-nvim-lsp' },  -- LSP source for nvim-cmp

	'junegunn/fzf',
	'junegunn/fzf.vim',

	'tpope/vim-surround',

	'jiangmiao/auto-pairs',

	'stevearc/oil.nvim',
	'nvim-tree/nvim-web-devicons',

	{
		'projekt0n/github-nvim-theme',
		config = function()
			vim.cmd.colorscheme('github_light')
		end
	},
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end,
	},
}
