local M = {}

local function get_colorscheme_file()
	local DEFAULT_COLORSCHEME_FILE = vim.fn.stdpath("data") .. "/colorscheme"
	return vim.g.colorscheme_file or DEFAULT_COLORSCHEME_FILE
end

local function save(colorscheme)
	local file = io.open(get_colorscheme_file(), "w")
	if file then
		file:write(colorscheme)
		file:close()
	end
end

M.setup = function()
	local file = io.open(get_colorscheme_file(), "r")
	if file then
		local colorscheme = file:read("*a")
		file:close()

		vim.cmd.colorscheme(colorscheme)
	end

	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			save(vim.g.colors_name)
		end,
	})
end

return M
