local lualine = require("lualine")

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "branch",      color = { bg = "NONE" } },
			{ "diff",        color = { bg = "NONE" } },
			{ "diagnostics", color = { bg = "NONE" } }
		},
		lualine_c = { { "filename", color = { bg = "NONE" } } },
		lualine_x = {
			{ "encoding",   color = { bg = "NONE" } },
			{ "fileformat", color = { bg = "NONE" } },
			{ "filetype",   color = { bg = "NONE" } }
		},
		lualine_y = {},
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", color = { bg = "NONE" } } },
		lualine_x = { { "location", color = { bg = "NONE" } } },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
