local opt = vim.opt
local map = vim.keymap.set
local g = vim.g

--filetypes
vim.cmd("autocmd BufRead,BufNewFile *.m set filetype=objc")

g.mapleader = " "

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smarttab = true
opt.smartindent = true

opt.undofile = true
opt.undodir = vim.fn.stdpath("config") .. "/undo"

opt.number = true
opt.relativenumber = true

opt.fillchars = "eob: "

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.termguicolors = true

opt.spell = false
opt.spelllang = { "en_us" }

opt.shell = "/usr/bin/zsh"


vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
    config = config or {}
    config.border = "single"
    return vim.lsp.handlers.hover(err, result, ctx, config)
end
vim.diagnostic.config({ float = { border = "single" } })

map("n", "<leader>u", ":Telescope<cr>")
map("n", "<leader>t", ":tabnew<cr>")
map("n", "<A-Right>", ":tabn<cr>")
map("n", "<A-Left>", ":tabp<cr>")
map("n", "<A-q>", ":bw<cr>")

map("n", "<leader>.", vim.diagnostic.open_float)

map("n", "<leader>=", "=")

map("n", "<leader>x", "<cmd>!chmod +x %<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		map("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		map("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		map("n", "<space>D", vim.lsp.buf.type_definition, opts)
		map("n", "<space>rn", vim.lsp.buf.rename, opts)
		map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})
local treeapi = require("nvim-tree.api")
map("n", "<leader>e", treeapi.tree.toggle, {})

map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
