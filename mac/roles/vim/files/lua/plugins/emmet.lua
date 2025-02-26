return {
	{
		'mattn/emmet-vim',
		config = function()
			vim.g.user_emmet_mode = 'n'
			vim.g.user_emmet_leader_key = '<C-y>'
			vim.g.user_emmet_settings = {
				indent_blockelement = 1,
			}
		end,
	},
}

