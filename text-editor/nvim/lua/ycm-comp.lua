HOME = os.getenv('HOME')

vim.g.ycm_global_ycm_extra_conf = HOME .. '/.config/nvim/.ycm_global_ycm_extra_conf.py'
vim.g.ycm_confirm_extra_conf = 0
vim.g.ycm_filepath_completion_use_working_dir = 1
vim.cmd([[
let g:ycm_semantic_triggers = { 'c': ['->', '.', 're!\w{3}'] }
]])
vim.g.ycm_add_preview_to_completeopt = 0
