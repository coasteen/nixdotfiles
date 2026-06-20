local colors = {
	foreground = "#ebdbb2",
	pink = "#b16286",
	red = "#cc241d",
	green = "#98971a",
	yellow = "#d79921",
	orange = "#d65d0e",
	magenta = "#b16286",
	cyan = "#458588",
	bg_darken = "#1d2021",
	dark_text = "#1d2021",
}

local M = {}

function M.setup()
	vim.cmd("hi StatusBackground guifg=" .. colors.foreground .. " guibg=" .. colors.bg_darken)
	vim.cmd("hi Moden guifg=" .. colors.dark_text .. " guibg=" .. colors.pink .. " gui=bold")
	vim.cmd("hi Modei guifg=" .. colors.dark_text .. " guibg=" .. colors.green .. " gui=bold")
	vim.cmd("hi Modev guifg=" .. colors.dark_text .. " guibg=" .. colors.yellow .. " gui=bold")
	vim.cmd("hi Modet guifg=" .. colors.dark_text .. " guibg=" .. colors.orange .. " gui=bold")
	vim.cmd("hi Modec guifg=" .. colors.dark_text .. " guibg=" .. colors.magenta .. " gui=bold")
	vim.cmd("hi Moder guifg=" .. colors.dark_text .. " guibg=" .. colors.red .. " gui=bold")
	vim.cmd("hi Filetype guifg=" .. colors.cyan .. " guibg=" .. colors.bg_darken .. " gui=bold")
	vim.cmd("hi Position guifg=" .. colors.yellow .. " guibg=" .. colors.bg_darken .. " gui=bold")
	vim.cmd("hi GitBranch guifg=" .. colors.orange .. " guibg=" .. colors.bg_darken .. " gui=bold")
	vim.cmd("hi GitDiff guifg=" .. colors.green .. " guibg=" .. colors.bg_darken)
	vim.cmd("hi GitDiffDel guifg=" .. colors.red .. " guibg=" .. colors.bg_darken)
	vim.cmd("hi Separator guifg=" .. colors.foreground .. " guibg=" .. colors.bg_darken)
	vim.cmd("hi LSPError guifg=" .. colors.red .. " guibg=" .. colors.bg_darken)
	vim.cmd("hi LSPWarn guifg=" .. colors.yellow .. " guibg=" .. colors.bg_darken)
	vim.cmd("hi LSPInfo guifg=" .. colors.cyan .. " guibg=" .. colors.bg_darken)
	vim.cmd("hi LSPOk guifg=" .. colors.green .. " guibg=" .. colors.bg_darken)

	vim.o.statusline = table.concat({
		"%{%v:lua.themeStatuslineMode()%} ",
		"%f ",
		"%{%v:lua.themeGitBranch()%} ",
		"%{%v:lua.themeGitDiff()%} ",
		"%{%v:lua.themeLSP()%} ",
		"%=",
		"%{%v:lua.themeStatuslineFiletype()%} ",
		"%{%v:lua.themeStatuslinePosition()%}",
	})
end

function themeStatuslineMode()
	local mode = vim.fn.mode()
	local mode_highlight = "Mode" .. mode:sub(1, 1)
	return string.format("%%#%s# %s %%#StatusBackground#", mode_highlight, mode:upper())
end

function themeStatuslineFiletype()
	return string.format("%%#Filetype# %s %%#Separator#│%%#StatusBackground#", vim.bo.filetype)
end

function themeStatuslinePosition()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	return string.format("%%#Position# %03d:%02d ", row, col)
end

function themeGitBranch()
	local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1] or ""
	if branch ~= "" then
		return string.format("%%#GitBranch# %s %%#Separator#│%%#StatusBackground#", branch)
	end
	return ""
end

function themeGitDiff()
	local diff = vim.fn.systemlist("git diff --shortstat 2>/dev/null")[1] or ""
	local added, removed = diff:match("(%d+) insertions?"), diff:match("(%d+) deletions?")
	added = added or "0"
	removed = removed or "0"
	if diff ~= "" then
		return string.format("%%#GitDiff#+%s %%#GitDiffDel#-%s %%#StatusBackground#", added, removed)
	end
	return ""
end

function themeLSP()
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warns = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	local str = ""
	if errors > 0 then
		str = str .. string.format("%%#LSPError#E:%d ", errors)
	end
	if warns > 0 then
		str = str .. string.format("%%#LSPWarn#W:%d ", warns)
	end
	if info > 0 then
		str = str .. string.format("%%#LSPInfo#I:%d ", info)
	end
	if hints > 0 then
		str = str .. string.format("%%#LSPOk#H:%d ", hints)
	end
	return str
end

return M
