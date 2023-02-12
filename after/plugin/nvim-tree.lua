vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")

require("nvim-tree").setup({
	sort_by = "case_sensitive",

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
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- &ft
	local filetype = vim.bo[data.buf].ft

	-- only files please
	if not real_file and not no_name then
		return
	end

	-- skip ignored filetypes
	if vim.tbl_contains(IGNORED_FT, filetype) then
		return
	end

	-- open the tree but don't focus it
	require("nvim-tree.api").tree.toggle({ focus = false })
end

vim.api.nvim_create_autocmd({"VimEnter"}, {callback = open_nvim_tree})

