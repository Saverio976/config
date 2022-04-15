function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, {silent = true})
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

function vmap(shortcut, command)
    map('v', shortcut, command)
end

function tmap(shortcut, command)
    map('t', shortcut, command)
end

nmap('<C-k>', '<Plug>MoveLineUp')
nmap('<C-j>', '<Plug>MoveLineDown')

vmap('<C-k>', '<Plug>MoveBlockUp')
vmap('<C-j>', '<Plug>MoveBlockDown')

nmap('<Tab>', '<Esc>:bNext<CR>')

nmap('<A-=>', '<CMD>lua require("FTerm").toggle()<CR>')
tmap('<A-=>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

nmap('<A-A>', '<CMD>lua vim.opt.background = "light"')
