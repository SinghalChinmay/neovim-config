local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

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
	} -- ReactJS snippets

	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'
	use 'mbbill/undotree' -- Managing undos and redos

	use 'jiangmiao/auto-pairs' -- Auto Pair plugin

	use 'andweeb/presence.nvim' -- Discord rich presence

	-- use 'segeljakt/vim-silicon' -- Code screenshots

	if packer_bootstrap then
		require("packer").sync()
	end
end)
