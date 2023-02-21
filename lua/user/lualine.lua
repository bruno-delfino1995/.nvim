local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " },
	cond = hide_in_width
}

local mode = {
	"mode",
}

local filename = {
	"filename",
	file_status = true,
	newfile_status = false,
	path = 0,
	symbols = {
		modified = '[+]',
		readonly = '[-]',
		unnamed = '[?]',
		newfile = '[#]',
	}
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0
}

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		ignore_focus = { "carbon.explorer" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { filename },
		lualine_c = { filetype, spaces, "encoding" },
		lualine_x = { branch, diff },
		lualine_y = { diagnostics },
		lualine_z = { location, progress },
	},
})
