return {

	{
		'nvim-telescope/telescope.nvim',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	-- File Explorer
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
	},

	{
		'nvim-treesitter/nvim-treesitter',
		branch='main',
		build=":TSUpdate",
		lazy=false,
		config = function ()
			require('nvim-treesitter.install').prefer_git = true
		end
	},
	'tpope/vim-commentary', -- gcc for commenting the current line, and gc + <Up>/<Down> for commenting multiple lines

	-- Colorschemes
	'sainnhe/sonokai',
	'LunarVim/darkplus.nvim',
	'marko-cerovac/material.nvim',

	-- Status Bar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
	},

	-- Buffer with tabpage integration
	{
		'akinsho/bufferline.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons'
	},
	'moll/vim-bbye', -- closing buffers without messing up the layout.

	'ap/vim-css-color',
	'lukas-reineke/indent-blankline.nvim',
	'goolord/alpha-nvim', -- Dashboard
	'wakatime/vim-wakatime',

	'ThePrimeagen/harpoon',

	-- Markdown Previewer
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	},

	'mg979/vim-visual-multi', -- Multiple cursors

	-- Terminal Manager
	'akinsho/toggleterm.nvim',

	-- {
	-- 	'dsznajder/vscode-es7-javascript-react-snippets',
	-- 	build = 'yarn install --frozen-lockfile && yarn compile'
	-- }, -- ReactJS snippets

	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',
	'mbbill/undotree', -- Managing undos and redos

	'andweeb/presence.nvim', -- Discord rich presence

	-- Highlight comments starting from words like TODO, HACK,FIXME etc
	{
		'folke/todo-comments.nvim',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	-- use 'segeljakt/vim-silicon' -- Code screenshots

	-- LSP setup

	{                                      -- Optional
		'williamboman/mason.nvim',
		build = function()
			pcall(vim.api.nvim_command, 'MasonUpdate')
		end,
	},
	{'williamboman/mason-lspconfig.nvim'}, -- Optional

	-- TODO: snippet working yet to be configured
	-- Autocompletion
	-- {'L3MON4D3/LuaSnip'},     -- Required
	-- 'github/copilot.vim',
}
