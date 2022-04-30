-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- completer
    -- uses:
    -- Tab : go next auto completion
    -- Arrow : change the auto completion select
    -- Enter : accept auto completion selected
    -- Ctrl+e : close auto completion popup
    -- Ctrl+k : popup doc
    -- gd : do to def
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer'
    }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-git' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    -- use {
    --     'tzachar/cmp-tabnine',
    --     run = './install.sh',
    --     requires = 'hrsh7th/nvim-cmp'
    -- }
    use { 'onsails/lspkind-nvim' }

    -- show passible binding when you dont end a keybinding
    use {
        'folke/which-key.nvim',
        config = function () require('which-key').setup({}) end
    }
    -- show function signature when you type
    use { 'ray-x/lsp_signature.nvim' }

    -- exit tab
    -- uses:
    -- :Sayonara : quit and close buffer and
    -- :Sayonara! : quit and close buffer + open next buffer
    use { 'mhinz/vim-sayonara' }

    -- epitech header
    -- uses:
    -- <F2> : epitech header
    -- :EpiHeader : epitech header
    use { 'Heliferepo/VimTek' }

    -- show trailing space
    use { 'ntpeters/vim-better-whitespace' }

    -- show context
    use {
        'haringsrob/nvim_context_vt',
        config = function()
            require('nvim_context_vt').setup ({
                disable_virtual_lines = true
            })
        end
    }
    -- highlight occurences of word under cursor
    use { 'RRethy/vim-illuminate' }

    -- motion
    -- uses:
    -- just highlight char that you can reach with 'f' or 'F'
    use { 'unblevable/quick-scope' }

    -- syntax higtligh
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = function() require('hlargs').setup({}) end
    }
    -- hightlight for C
    use { 'bfrg/vim-cpp-modern' }
    use {
        'folke/lsp-colors.nvim',
        config = function() require('lsp-colors').setup({}) end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('indent_blankline').setup({}) end
    }
    -- highlight for v
    use { 'ollykel/v-vim' }
    -- info for regexp
    use {
        'bennypowers/nvim-regexplainer',
        config = function() require('regexplainer').setup({auto = true}) end,
        requires = { 'nvim-treesitter/nvim-treesitter', 'MunifTanjim/nui.nvim' }
    }

    -- multiple cursor
    -- uses:
    -- Ctrl+n : select word for new cursor
    -- Ctrl+Up / Ctrl+Down : new cursor
    use { 'mg979/vim-visual-multi', branch = 'master' }

    -- comment lines
    -- uses:
    -- gc : add / remove comment mark line
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup({}) end
    }

    -- auto save
    use {
        'Pocco81/AutoSave.nvim',
        config = function() require('autosave').setup({ enable = true }) end
    }

    -- move block / line
    -- uses:
    -- Ctrl+k : up the selected block
    -- Ctrl+j : down the selected block
    use { 'matze/vim-move' }

    -- transparent background
    -- uses:
    -- :TransparentEnable
    -- :TransparentDisable
    -- :TransparentToggle
    use {
        'xiyaowong/nvim-transparent',
        config = function() require('transparent').setup({enable = true}) end
    }
    -- theme
    -- :colorscheme duskfox
    -- :colorscheme dayfox
    use { 'EdenEast/nightfox.nvim' }
    -- :colorscheme kanagawa
    use {
        'rebelot/kanagawa.nvim',
        config = function()
            require('kanagawa').setup({
                undercurl = true,           -- enable undercurls
                commentStyle = "italic",
                functionStyle = "italic",
                keywordStyle = "italic",
                statementStyle = "bold",
                typeStyle = "bold",
                variablebuiltinStyle = "italic",
                specialReturn = true,       -- special highlight for the return keyword
                transparent = false,        -- do not set background color
            })
        end
    }
    -- better default ui settings
    use {
        'stevearc/dressing.nvim',
        config = function () require('dressing').setup({}) end
    }

    -- folder explorer
    -- uses:
    -- a : add a folder/file
    -- c : copy a folder/file
    -- p : paste a folder/file
    -- x : cut a folder/file
    -- r : rename
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup({
                disable_netrw = true,
                open_on_setup = true,
                view = {
                    width = 25,
                    height = "100%",
                    preserve_window_proportions = true,
                },
                actions = { open_file = { resize_window = true } }
            })
        end
    }
    -- see yank and rgisters
    -- uses:
    -- " : see registers
    use { 'tversteeg/registers.nvim' }

    -- fuzzy finder / go to file
    -- uses:
    -- :Telescope live_grep : (need install ripgrep)
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup({}) end
    }

    -- status line
    use { 'lambdalisue/battery.vim' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({
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
                    lualine_z = {'location', 'battery#component'}
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
            })
        end
    }

    -- show buffer
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('bufferline').setup({
                options = {
                    mode = "buffers",
                    show_buffer_close_icons = false
                }
            })
        end
    }

    -- git
    -- uses:
    -- :Neogit : prompt window with info / commit / push
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('neogit').setup({}) end
    }

    -- use different color for { [ ( to better distinguish them
    use {
        'p00f/nvim-ts-rainbow',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                rainbow = {
                    enable = true,
                    extended_mode = true,
                }
            })
        end
    }

    -- auto close pairs
    use {
        'steelsojka/pears.nvim',
        config = function() require('pears').setup() end
    }

    -- floating terminal
    -- uses:
    -- Alt+= : prompt floating terminal
    use { 'numToStr/FTerm.nvim' }

    -- discord rich presence
    use { 'andweeb/presence.nvim' }

    -- spell
    -- uses:
    -- :GramarousCheck
    use { 'rhysd/vim-grammarous' }

    -- dowygen doc
    -- uses:
    -- :Dox
    use { 'vim-scripts/DoxygenToolkit.vim' }

    -- play tetris
    use { 'alec-gibson/nvim-tetris' }
end)
