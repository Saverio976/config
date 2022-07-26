
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Automate ❱━━━━━━━━━━━━━━━━━━━━ --

local group = vim.api.nvim_create_augroup("AbstractAutoGroup", {clear=true})

vim.api.nvim_create_autocmd(
	"TextYankPost",
	{
        desc = "highlight text on yank",
        pattern = "*",
		group = group,
        callback = function()
			vim.highlight.on_yank {
				higroup="Search", timeout=400, on_visual=true
			}
        end,
	}
)

-- jump to the last position when reopening a file
vim.cmd([[
	if has("autocmd")
		au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	endif
]])

vim.cmd([[
au! BufLeave <buffer> if &modified == 1 | write | endif
]])

vim.api.nvim_create_autocmd(
	"BufWritePre",
	{
		desc = "remove whitespaces on save",
		pattern = "*",
		group = group,
		command = "%s/\\s\\+$//e",
	}
)

vim.api.nvim_create_autocmd(
	"BufEnter",
	{
		desc = "don't auto comment new line",
		pattern = "*",
		group = group,
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	}
)

vim.api.nvim_create_autocmd(
	"VimResized",
	{
		desc = "auto resize splited windows",
		pattern = "*",
		group = group,
		command = "tabdo wincmd =",
	}
)

vim.api.nvim_create_autocmd(
	"BufNewFile,BufRead",
	{
		desc = "set .h to c filetype",
		pattern = "*.h",
		group = group,
		command = "set filetype=c"
	}
)

vim.api.nvim_create_autocmd(
	"BufNewFile,BufRead",
	{
		desc = "set .v to v filetype",
		pattern = "*.v",
		group = group,
		command = "set filetype=v"
	}
)

-- ━━━━━━━━━━━━━━━━❰ end of Automate ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

