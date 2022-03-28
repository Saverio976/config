-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- completer
    -- use { 'tabnine/YouCompleteMe' }
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-git' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use {
        'tzachar/cmp-tabnine',
        run='./install.sh',
        requires = 'hrsh7th/nvim-cmp'
    }

    use { 'onsails/lspkind-nvim' }

    -- exit tab
    use { 'mhinz/vim-sayonara' }

    -- cursor underline word
    use { 'yamatsum/nvim-cursorline' }

    -- epitech header
    use { 'Heliferepo/VimTek' }

    -- show trailing space
    use { 'ntpeters/vim-better-whitespace' }

    -- motion
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

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
            require('autosave').setup { enable = true }
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
            require('nvim-tree').setup {
                disable_netrw = true,
                open_on_setup = true,
                view = {
                    width = 25,
                    height = "100%",
                    preserve_window_proportions = true,
                },
                actions = {
                    open_file = {
                        resize_window = true
                    }
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

    -- status line
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

    -- git
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
                    max_file_lines = 100000, -- Do not enable for files with more than n lines, int
                }
            }
        end
    }

    -- auto close pairs
    use {
        'steelsojka/pears.nvim',
        config = function()
            require('pears').setup()
        end
    }

    -- floating terminal
    use { 'numToStr/FTerm.nvim' }

    -- discord rich presence
    use { 'andweeb/presence.nvim' }

    -- spell
    use {
        'lewis6991/spellsitter.nvim',
        config = function()
            require('spellsitter').setup {
                enable = true
            }
        end
    }

    use { 'vim-scripts/DoxygenToolkit.vim' }

end)
