local M = {}

local function get_colorscheme_file()
	local DEFAULT_COLORSCHEME_FILE = vim.fn.stdpath("data") .. "/colorscheme"
	return vim.g.colorscheme_file or DEFAULT_COLORSCHEME_FILE
end

M.load = function()
	local file = io.open(get_colorscheme_file(), "r")
	if file then
		local colorscheme = file:read("*a")
		file:close()

		vim.cmd.colorscheme(colorscheme)
	end
end

M.save = function(colorscheme)
	local file = io.open(get_colorscheme_file(), "w")
	if file then
		file:write(colorscheme)
		file:close()
	end
end

return M
