local tp = require("theme-persist")

tp.load()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		tp.save(vim.g.colors_name)
	end,
})
