local P = {

}

function P.setup()
	local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			require('go.format').goimport()
		end,
		group = format_sync_grp,
	})

	local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			require('go.format').gofmt()
		end,
		group = format_sync_grp,
	})
end

return P
