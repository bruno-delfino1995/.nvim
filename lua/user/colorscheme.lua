local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.opt.cursorcolumn = false -- disable column hightlight
vim.opt.cursorline = false -- disable line hightlight
vim.cmd("call matchadd('ColorColumn', '\\%81v')") -- hightlight characters at column 81
