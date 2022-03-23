-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim' }

	use { 'tabnine/YouCompleteMe' }

	use { 'mhinz/vim-sayonara' }

	use { 'itchyny/vim-cursorword' }

	use { 'Heliferepo/VimTek' }

	use { 'ntpeters/vim-better-whitespace' }

	use { 'unblevable/quick-scope' }

	use { 'Shougo/echodoc.vim' }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use { 'vim-airline/vim-airline' }

	use { 'terryma/vim-multiple-cursors' }

	use { 'bfrg/vim-cpp-modern' }

	use { 'gelguy/wilder.nvim' }

	use { '907th/vim-auto-save' }

	use { 'matze/vim-move' }

	use { 'EdenEast/nightfox.nvim' }

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
		config = function() require'nvim-tree'.setup {
            open_on_setup = true,
            view = {
                width = 25,
                height = "100%",
                preserve_window_proportions = true
            }
        } end
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup()
		end
	}

end)
