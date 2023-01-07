vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- File Explorer
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run="TSUpdate"
	}
	use 'tpope/vim-commentary' -- gcc for commenting the current line, and gc + <Up>/<Down> for commenting multiple lines

	-- Colorschemes
	use 'tomasiser/vim-code-dark'
	use 'marko-cerovac/material.nvim'

	-- Status Bar
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Buffer with tabpage integration
	use {
		'akinsho/bufferline.nvim',
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons'
	}

	use 'moll/vim-bbye' -- closing buffers without messing up the layout.

	use 'ap/vim-css-color'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'goolord/alpha-nvim' -- Dashboard
	use 'wakatime/vim-wakatime'

	use 'ThePrimeagen/harpoon'

	-- Markdown Previewer
	use({ 
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" }, 
	})

	use 'mg979/vim-visual-multi' -- Multiple cursors

	-- Terminal Manager
	use {
		"akinsho/toggleterm.nvim",
		tag = '*'
	}

	-- Code completion
	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}
	use "rafi/vim-venom" -- Virtual environment management for python
	-- use "github/copilot.vim"
	
	use {
		'dsznajder/vscode-es7-javascript-react-snippets',
		run = 'yarn install --frozen-lockfile && yarn compile'
	}

	use 'tpope/vim-fugitive'
	use 'mbbill/undotree' -- Managing undos and redos
end)
