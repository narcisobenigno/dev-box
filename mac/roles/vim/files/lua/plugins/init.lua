local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	'junegunn/fzf',
	'junegunn/fzf.vim',

	'tpope/vim-surround',

	'stevearc/oil.nvim',
	'nvim-tree/nvim-web-devicons',

	{
		'projekt0n/github-nvim-theme',
		config = function()
			vim.cmd.colorscheme('github_light')
		end
	},

	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end,
	},

	{
		"ray-x/go.nvim",
		dependencies = {  -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require('go').setup()
			local on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
			end
			require('lspconfig').gopls.setup({on_attach = on_attach})
			require("plugins.config.gonvim").setup()
		end,
		event = {"CmdlineEnter"},
		ft = {"go", 'gomod'},
		build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},
})
