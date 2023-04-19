vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")
local bind = vim.keymap.set

local function open_nvim_tree(data)
	local IGNORED_FT = {
		"markdown",
		"startify",
		"dashboard",
		"alpha",
	}

	-- buffer is a real file on the disk
	local real_file = vim.fn.filereadable(data.file) == 1

	-- buffer is a [No Name]
	-- local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- &ft
	local filetype = vim.bo[data.buf].ft

	-- only files please
	if not real_file then
		return
	end

	-- skip ignored filetypes
	if vim.tbl_contains(IGNORED_FT, filetype) then
		return
	end

	-- open the tree but don't focus it
	require("nvim-tree.api").tree.toggle({ focus = false })
end

local function on_attach(bufnr)
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	bind('n', 'u', api.tree.change_root_to_parent, opts('Up'))
	bind('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
	bind('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
	bind('n', 't', api.node.open.tab, opts('Open: New Tab'))
end

require("nvim-tree").setup({
	on_attach = on_attach,
	sort_by = "case_sensitive",

	git = {
		enable = true,
		ignore = false,
		timeout = 400
	},
	view = {
		adaptive_size = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = true,
		icons = {
			hint = " ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		icons = {
			webdev_colors = true,
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
})

bind("n", "<leader>n", api.tree.focus) -- Focus the file explorer
bind("n", "<C-t>", api.tree.toggle) -- Toggle the tree


vim.api.nvim_create_autocmd({"VimEnter"}, {callback = open_nvim_tree})

