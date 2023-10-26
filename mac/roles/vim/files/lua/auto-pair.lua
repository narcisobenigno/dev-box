local function noremap(lhs, rhs)
	vim.keymap.set('i', lhs, rhs, { noremap = true, silent = true })
end

noremap('{', '{}<left>')
noremap('(', '()<left>')
noremap('[', '[]<left>')
noremap('"', '""<left>')
noremap("'", "''<left>")

