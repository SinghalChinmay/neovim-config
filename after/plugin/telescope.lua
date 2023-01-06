local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local key = vim.keymap

require("telescope").setup({
	defaults = {
		prompt_prefix = "🔍 ",
		selection_caret = " ",
		mappings = {
			i = {
				["<Esc>"] = actions.close,
				["<C-Up>"] = actions.preview_scrolling_up,
				["<C-Down>"] = actions.preview_scrolling_down,
			},
		}
	},
	pickers = {
		find_files = {theme = "dropdown"},
		git_files = {theme = "dropdown"}
	}
})

key.set("n", "<leader>ff", builtin.find_files, {})
key.set("n", "<leader>gf", builtin.git_files, {})
key.set("n", "<leader>cg", builtin.git_commits, {})
key.set("n", "<leader>ht", builtin.help_tags, {})
key.set("n", "<leader>?", builtin.keymaps, {})
key.set("n", "<leader>fg", builtin.live_grep, {})

