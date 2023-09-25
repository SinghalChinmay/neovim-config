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
	use 'sainnhe/sonokai'
	use 'LunarVim/darkplus.nvim'
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

	use {
		'dsznajder/vscode-es7-javascript-react-snippets',
		run = 'yarn install --frozen-lockfile && yarn compile'
	} -- ReactJS snippets

	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'
	use 'mbbill/undotree' -- Managing undos and redos

	use 'jiangmiao/auto-pairs' -- Auto Pair plugin

	use 'andweeb/presence.nvim' -- Discord rich presence

	-- Highlight comments starting from words like TODO, HACK,FIXME etc
	use {
		'folke/todo-comments.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- use 'segeljakt/vim-silicon' -- Code screenshots

	-- LSP setup

	use 'onsails/lspkind.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.api.nvim_command, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-path'},
		}
	}
	use "github/copilot.vim"
	use {
		'tzachar/cmp-tabnine',
		run='./install.sh',
		requires = 'hrsh7th/nvim-cmp'
	}

	if packer_bootstrap then
		require("packer").sync()
	end
end)
