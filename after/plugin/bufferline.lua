local bind = vim.keymap.set

require("bufferline").setup {
	options = {
		close_command = "Bdelete! %d",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true
			}
		},
	}
}

bind("n", "<C-RIGHT>", vim.cmd.BufferLineCycleNext) -- Go to next buffer
bind("n", "<C-LEFT>", vim.cmd.BufferLineCyclePrev) -- Go to previous buffer
bind("n", "<leader>q", ":Bdelete!<CR>") -- Delete buffer without messing the layout
bind("n", "<A-RIGHT>", vim.cmd.BufferLineMoveNext) -- Move the buffer to the right
bind("n", "<A-LEFT>", vim.cmd.BufferLineMovePrev) -- Move the buffer to the left

