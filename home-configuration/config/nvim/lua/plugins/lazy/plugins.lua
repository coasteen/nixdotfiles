return {
	"andweeb/presence.nvim",
	"catppuccin/nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 1000,
		build = ":TSUpdate",
	},
	"f3fora/cmp-spell",
	{
		"debugloop/telescope-undo.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
	},
	{
		"chomosuke/typst-preview.nvim",
		lazy = false,
		version = "1.*",
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-mini/mini.nvim",
		},
		opts = {},
	},
	"sitiom/nvim-numbertoggle",
	"mluders/comfy-line-numbers.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0.35,
				color = { "Normal" },
				term_bg = "#282828",
				inactive = false,
			},
			context = 15,
			treesitter = true,
			expand = {
				"function",
				"method",
				"table",
				"if_statement",
			},
			exclude = {
				"md",
			},
		},
	},
	"nguyenvukhang/nvim-toggler",
	"alvan/vim-closetag",
	{
		"numtostr/fterm.nvim",
		border = "double",
		dimensions = {
			height = 0.9,
			width = 0.9,
		},
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},
}
