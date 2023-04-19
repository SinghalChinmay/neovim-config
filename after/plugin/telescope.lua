local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local bind = vim.keymap.set

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
		find_files = {theme = "dropdown", hidden = true},
		git_files = {theme = "dropdown"}
	}
})

bind("n", "<leader>ff", builtin.find_files, {})
bind("n", "<leader>gf", builtin.git_files, {})
bind("n", "<leader>cg", builtin.git_commits, {})
bind("n", "<leader>ht", builtin.help_tags, {})
bind("n", "<leader>?", builtin.keymaps, {})
bind("n", "<leader>fg", builtin.live_grep, {})

