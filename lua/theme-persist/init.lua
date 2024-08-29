local M = {}

local function get_colorscheme_file()
	local DEFAULT_COLORSCHEME_FILE = vim.fn.stdpath("data") .. "/colorscheme"
	return vim.g.colorscheme_file or DEFAULT_COLORSCHEME_FILE
end

M.load = function()
	local file = io.open(get_colorscheme_file(), "r")
	if file then
		local colorscheme = io.read("*a")
		vim.cmd.colorscheme(colorscheme)
	end
end

M.save = function(colorscheme)
	local file = io.open(get_colorscheme_file(), "w")
	if file then
		io.write(colorscheme)
	end
end

return M
