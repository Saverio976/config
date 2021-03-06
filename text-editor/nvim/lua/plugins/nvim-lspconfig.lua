
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-lspconfig
--   Github:    github.com/neovim/nvim-lspconfig
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --





-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local M = {}

-- -- change float window border
-- -- [https://github.com/williamboman/nvim-lsp-installer/issues/475#issuecomment-1037222808]
-- -- [NOTE: this setting can consume upto 20ms startup time]
-- local lspconfig_window = require("lspconfig.ui.windows")
-- local old_defaults = lspconfig_window.default_opts
--
-- function lspconfig_window.default_opts(opts)
--     local win_opts = old_defaults(opts)
--     win_opts.border = "rounded"
--     return win_opts
-- end

-- options for lsp diagnostic
-- ───────────────────────────────────────────────── --
vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					signs = true,
					update_in_insert = true,
					virtual_text = {
						true,
						spacing = 6,
						-- severity_limit='Error'  -- Only show virtual text on error
					},
				})

vim.diagnostic.config({
	float = {
		border = "rounded",
		focusable = true,
		style = "minimal",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] =
				vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})

vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"})

-- show diagnostic on float window(like auto complete)
-- vim.api.nvim_command [[ autocmd CursorHold  *.lua,*.sh,*.bash,*.dart,*.py,*.cpp,*.c,js lua vim.lsp.diagnostic.show_line_diagnostics() ]]

-- se LSP diagnostic symbols/signs
-- ─────────────────────────────────────────────────--
vim.api.nvim_command [[ sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl= ]]
vim.api.nvim_command [[ sign define DiagnosticSignWarn  text= texthl=DiagnosticSignWarn  linehl= numhl= ]]
vim.api.nvim_command [[ sign define DiagnosticSignInfo  text= texthl=DiagnosticSignInfo  linehl= numhl= ]]
vim.api.nvim_command [[ sign define DiagnosticSignHint  text= texthl=DiagnosticSignHint  linehl= numhl= ]]

vim.api.nvim_command [[ hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#840000 ]]
vim.api.nvim_command [[ hi DiagnosticUnderlineHint cterm=underline  gui=underline guisp=#07454b ]]
vim.api.nvim_command [[ hi DiagnosticUnderlineWarn cterm=underline  gui=underline guisp=#2f2905 ]]
vim.api.nvim_command [[ hi DiagnosticUnderlineInfo cterm=underline  gui=underline guisp=#265478 ]]

-- Auto-format files prior to saving them
-- vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]

--[[
   " to change colors, it's better to define in color scheme
   " highlight LspDiagnosticsUnderlineError         guifg=#EB4917 gui=undercurl
   " highlight LspDiagnosticsUnderlineWarning       guifg=#EBA217 gui=undercurl
   " highlight LspDiagnosticsUnderlineInformation   guifg=#17D6EB gui=undercurl
   " highlight LspDiagnosticsUnderlineHint          guifg=#17EB7A gui=undercurl
--]]

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --




-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- ───────────────────────────────────────────────── --
M.on_attach = function(client, bufnr)

	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	---------------------
	-- Avoiding LSP formatting conflicts
	-- ref: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
	-- 2nd red: https://github.com/neovim/nvim-lspconfig/issues/1891#issuecomment-1157964108
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	--------------------------

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local options = {noremap = true, silent = true}

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- ───────────────────────────────────────────────── --
	buf_set_keymap('n', 'ge',           '<cmd>lua vim.diagnostic.open_float()<CR>', options)
	buf_set_keymap('n', 'gq',           '<cmd>lua vim.diagnostic.set_loclist({})<CR>', options)
	buf_set_keymap('n', 'gn',           '<cmd>lua vim.diagnostic.goto_next()<CR>', options)
	buf_set_keymap('n', 'gb',           '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)

	buf_set_keymap('n', 'gd',           '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
	buf_set_keymap('n', 'gD',           '<Cmd>lua vim.lsp.buf.declaration()<CR>', options)
	buf_set_keymap('n', 'gGG',           '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
	buf_set_keymap('n', 'gi',           '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
	buf_set_keymap('n', 'gs',           '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
	buf_set_keymap('n', 'gh',           '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
	buf_set_keymap('n', 'K',            '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
	-- using 'filipdutescu/renamer.nvim' for rename
	-- buf_set_keymap('n', '<space>rn',	'<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr',			'<cmd>lua vim.lsp.buf.references()<CR>', options)
	buf_set_keymap("n", "gf",          '<cmd>lua vim.lsp.buf.format{ async=true }<CR>', options)

	buf_set_keymap('n', 'ga',           '<cmd>lua vim.lsp.buf.code_action()<CR>',       options)
	buf_set_keymap('x', 'ga',           '<cmd>lua vim.lsp.buf.range_code_action()<CR>', options)

	-- buf_set_keymap('n', '<leader>wa',    '<cmd>lua vim.lsp.buf.add_workleader_folder()<CR>',          opts)
	-- buf_set_keymap('n', '<leader>wr',    '<cmd>lua vim.lsp.buf.remove_workleader_folder()<CR>',       opts)
	-- buf_set_keymap('n', '<leader>wl',   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workleader_folders()))<CR>', opts)
end


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

return M

