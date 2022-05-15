local function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, {silent = true})
end

local function nmap(shortcut, command)
    map('n', shortcut, command)
end

local function imap(shortcut, command)
    map('i', shortcut, command)
end

local function vmap(shortcut, command)
    map('v', shortcut, command)
end

local function tmap(shortcut, command)
    map('t', shortcut, command)
end

nmap('<C-k>', '<Plug>MoveLineUp')
nmap('<C-j>', '<Plug>MoveLineDown')

vmap('<C-k>', '<Plug>MoveBlockUp')
vmap('<C-j>', '<Plug>MoveBlockDown')

nmap('<Tab>', '<Esc>:bNext<CR>')

nmap('<A-=>', '<CMD>lua require("FTerm").toggle()<CR>')
tmap('<A-=>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

imap('<C-Tab>', '<CMD>lua require("luasnip").jump(1)<CR>')

vim.g.registers_normal_mode = 0

nmap('<M-Esc>', '<Esc>:NeoZoomToggle<CR>')

nmap('<M-z>', ':JABSOpen<CR>')
imap('<M-z>', '<Esc>:JABSOpen<CR>')
