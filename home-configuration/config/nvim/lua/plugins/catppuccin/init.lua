local colors = {
	black = "#121212",
	white = "#ffffff",
	gray = "#7e7e7e",
	light_gray = "#d0d0d0",
	dark_gray = "#505050",
	red = "#ff5c57",
	green = "#5af78e",
	yellow = "#f3f99d",
	blue = "#57c7ff",
	purple = "#d183e8",
	cyan = "#9aedfe",
}

local highlights = {
	Normal = { fg = colors.light_gray, bg = "NONE" },
	NormalNC = { fg = colors.light_gray, bg = "NONE" },
	SignColumn = { bg = "NONE" },
	FoldColumn = { bg = "NONE" },
	Comment = { fg = colors.gray, italic = true },
	Constant = { fg = colors.blue },
	String = { fg = colors.green },
	Identifier = { fg = colors.blue },
	Function = { fg = colors.purple },
	Statement = { fg = colors.yellow },
	PreProc = { fg = colors.cyan },
	Type = { fg = colors.blue },
	Special = { fg = colors.red },
	Underlined = { fg = colors.white, underline = true },
	Todo = { fg = colors.black, bg = colors.yellow, bold = true },
	StatusLine = { fg = colors.white, bg = "NONE" },
	StatusLineNC = { fg = colors.light_gray, bg = "NONE" },
	NvimTreeNormal = { fg = colors.light_gray, bg = "NONE" },
	NvimTreeNormalNC = { fg = colors.light_gray, bg = "NONE" },
	NvimTreeWinSeparator = { fg = colors.dark_gray, bg = "NONE" },
	NvimTreeFolderName = { fg = colors.blue, bold = true },
	NvimTreeOpenedFolderName = { fg = colors.green, bold = true },
	NvimTreeRootFolder = { fg = colors.yellow, bold = true, underline = true },
	NvimTreeFileIcon = { fg = colors.light_gray },
	NvimTreeGitDirty = { fg = colors.red },
	NvimTreeGitStaged = { fg = colors.green },
	NvimTreeGitNew = { fg = colors.blue },
	NvimTreeGitRenamed = { fg = colors.purple },
	NvimTreeGitDeleted = { fg = colors.red },
	CursorLine = { bg = colors.dark_gray },
}

for group, opts in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, opts)
end

local inactive_style = { fg = colors.dark_gray, bg = "NONE" }

require("lualine").setup({
	options = {
		theme = {
			normal = {
				a = { fg = colors.black, bg = colors.white, gui = "bold" },
				b = { fg = colors.white, bg = colors.dark_gray },
				c = { fg = colors.white, bg = "NONE" },
			},
			inactive = {
				a = { fg = colors.dark_gray, bg = "NONE", gui = "bold" },
				b = inactive_style,
				c = inactive_style,
			},
		},
	},
})

require("nvim-tree").setup({
	view = {
		width = 30,
		side = "left",
	},
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":~",
		icons = {
			show = {
				file = true,
				folder = true,
				git = true,
			},
		},
	},
	filters = {
		dotfiles = false,
	},
})
