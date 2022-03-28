vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.lazyredraw = true
vim.opt.ttyfast = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cindent = true
vim.opt.expandtab = true

vim.opt.showmode = false

vim.opt.ruler = true
vim.opt.colorcolumn = "80"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.cursorline = true

vim.opt.wildignore = "*.docx,*.jpg,*.gif,*.pyc,*.o,*.a,*.odt"

vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.syntax = "true"
vim.opt.termguicolors = true

vim.opt.background = "dark"
vim.cmd('colorscheme nightfox')

require('ycm-comp')
require('cpp-modern')
vim.g.move_map_keys = 0
require('lspconfig-custom')

require('mappings-custom')

require('plugins')
