-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- completer
    use { 'tabnine/YouCompleteMe' }

    -- exit tab
    use { 'mhinz/vim-sayonara' }

    -- cursor underline word
    use { 'itchyny/vim-cursorword' }

    -- epitech header
    use { 'Heliferepo/VimTek' }

    -- show trailing space
    use { 'ntpeters/vim-better-whitespace' }

    -- motion
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    -- doc on echo zone
    use { 'Shougo/echodoc.vim' }

    -- syntax higtligh
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- multiple cursor
    use { 'mg979/vim-visual-multi', branch = 'master' }

    -- hightlight for C
    use { 'bfrg/vim-cpp-modern' }

    -- auto save
    use {
        'Pocco81/AutoSave.nvim',
        config = function()
            require('autosave').setup {
                enable = true
            }
        end
    }

    -- move block / line
    use { 'matze/vim-move' }

    -- theme
    use { 'EdenEast/nightfox.nvim' }

    -- folder explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require'nvim-tree'.setup {
                open_on_setup = true,
                view = {
                    width = 25,
                    height = "100%",
                    preserve_window_proportions = true
                }
            }
        end
    }

    -- go to file
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup {}
        end
    }

    --
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {},
                    always_divide_middle = true,
                    globalstatus = false,
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            }
        end
    }

    -- show buffer
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('bufferline').setup {
                options = {
                    mode = "buffers",
                    show_buffer_close_icons = false
                }
            }
        end
    }

    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('neogit').setup {}
        end
    }

    use {
        'p00f/nvim-ts-rainbow',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
                }
            }
        end
    }

    use {
        'steelsojka/pears.nvim',
        config = function()
            require('pears').setup()
        end
    }

    use { 'numToStr/FTerm.nvim' }

    use { 'andweeb/presence.nvim' }

end)
