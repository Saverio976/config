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

nmap('<C-k>', '<Plug>MoveLineUp')
nmap('<C-j>', '<Plug>MoveLineDown')

vmap('<C-k>', '<Plug>MoveBlockUp')
vmap('<C-j>', '<Plug>MoveBlockDown')
