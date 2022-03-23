function autocmd(event, command)
    vim.api.nvim_create_autocmd(event, {callback = command})
    -- vim.api.nvim_create_autocmd(event, {command = command})
end
