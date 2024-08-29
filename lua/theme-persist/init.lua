local M = {}

local function get_colorscheme_file()
	local DEFAULT_COLORSCHEME_FILE = vim.fn.stdpath("data") .. "/colorscheme"
	return vim.g.colorscheme_file or DEFAULT_COLORSCHEME_FILE
end

M.load = function()
	vim.notify("Loading colorscheme")
	local file = io.open(get_colorscheme_file(), "r")
	if file then
		local colorscheme = io.read("*a")
		vim.cmd.colorscheme(colorscheme)
	else
		vim.notify("Failed to load file")
	end
end

M.save = function(colorscheme)
	vim.notify("Saving colorscheme")
	local file = io.open(get_colorscheme_file(), "w")
	if file then
		io.write(colorscheme)
	else
		vim.notify("Failed to write file")
	end
end

return M
