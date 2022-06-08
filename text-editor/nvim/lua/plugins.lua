-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {
        'lewis6991/impatient.nvim',
        config = function () require('impatient') end
    }
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
    -- zoom a buffer
    -- uses:
    -- :NeoZoomToggle
    use {
        'nyngwang/NeoZoom.lua',
        config = function() require('neo-zoom').setup({}) end
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
    -- uses:
    -- :JABSOpen
    -- Meta-z
    use {
        'matbme/JABS.nvim',
        config = function ()
            local ui = vim.api.nvim_list_uis()[1]
            require('jabs').setup({
                position = 'corner', -- center, corner
                width = 50,
                height = 10,
                border = 'solid', -- none, single, double, rounded, solid, shadow, (or an array or chars)

                -- Options for preview window
                preview_position = 'left', -- top, bottom, left, right
                preview = {
                    width = 40,
                    height = 30,
                    border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or chars)
                },

                -- the options below are ignored when position = 'center'
                col = ui.width,  -- Window appears on the right
                row = ui.height/2, -- Window appears in the vertical middle
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

    -- cheat.sh
    -- uses:
    -- :Cheat : a prompt will ask for what you search
    use {
        'RishabhRD/popfix',
        'RishabhRD/nvim-cheat.sh'
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
    -- uses:
    -- :Testris
    use { 'alec-gibson/nvim-tetris' }
    -- another game
    -- uses:
    -- :KillKillKill
    use {
        'seandewar/killersheep.nvim',
        config = function ()
            require("killersheep").setup({
                gore = false,
                keymaps = {
                    move_left = "h",     -- Keymap to move cannon to the left.
                    move_right = "l",    -- Keymap to move cannon to the right.
                    shoot = "<Space>",   -- Keymap to shoot the cannon.
                },
            })
        end
    }

    use { 'gpanders/editorconfig.nvim' }

    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function ()
            require("octo").setup()
        end
    }

    use {
        'rcarriga/nvim-notify',
        config = function ()
            require("notify").setup({
                background_colour = "#000000"
            })
            vim.notify = require("notify")
        end
    }

    use {
        'cappyzawa/trim.nvim',
        config = function ()
            require('trim').setup({
                -- if you want to ignore markdown file.
                -- you can specify filetypes.
                disable = {"markdown"},

                -- if you want to ignore space of top
                patterns = {
                    [[%s/\s\+$//e]],
                    [[%s/\($\n\s*\)\+\%$//]],
                    [[%s/\(\n\n\)\n\+/\1/]],
                },
            })
        end
    }

    use {
        'lukas-reineke/virt-column.nvim',
        config = function ()
            require("virt-column").setup()
        end
    }

    use { 'LunarWatcher/auto-pairs' }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function ()
            require'colorizer'.setup()
        end
    }

    use {
        's1n7ax/nvim-comment-frame',
        requires = { { 'nvim-treesitter' } },
        config = function() require('nvim-comment-frame').setup() end
    }

    use {
        'axieax/urlview.nvim',
        config = function()
            require("urlview").setup({
                -- Prompt title (`<context> <default_title>`, e.g. `Buffer Links:`)
                default_title = "Links:",
                -- Default picker to display links with
                -- Options: "native" (vim.ui.select) or "telescope"
                default_picker = "telescope",
                -- Set the default protocol for us to prefix URLs with if they don't start with http/https
                default_prefix = "https://",
                -- Command or method to open links with
                -- Options: "netrw", "system" (default OS browser); or "firefox", "chromium" etc.
                navigate_method = "system",
                -- Ensure links shown in the picker are unique (no duplicates)
                unique = true,
                -- Ensure links shown in the picker are sorted alphabetically
                sorted = true,
                -- Logs user warnings (recommended for error detection)
                debug = true,
                -- Custom search captures
                -- NOTE: captures follow Lua pattern matching (https://riptutorial.com/lua/example/20315/lua-pattern-matching)
                custom_searches = {
                    -- KEY: search source name
                    -- VALUE: custom search function or table (map with keys capture, format)
                    jira = {
                        capture = "AXIE%-%d+",
                        format = "https://jira.axieax.com/browse/%s",
                    },
                },
            })
            require("telescope").load_extension("urlview")
        end
    }

    use { 'hrsh7th/vim-searchx' }

    use { 'adelarsq/vim-emoji-icon-theme' }

end)
