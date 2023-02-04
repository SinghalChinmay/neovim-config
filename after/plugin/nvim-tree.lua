vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")

require("nvim-tree").setup({
	sort_by = "case_sensitive",

	open_on_setup = true,
	open_on_setup_file = true,
	open_on_tab = true,

	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},

	git = {
		enable = true,
		ignore = false,
		timeout = 400
	},
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				{ key = "v", action = "vsplit" },
				{ key = "i", action = "split" },
				{ key = "t", action = "tabnew" }
			},
		},
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

vim.keymap.set("n", "<leader>n", api.tree.focus) -- Focus the file explorer
vim.keymap.set("n", "<C-t>", api.tree.toggle) -- Toggle the tree

