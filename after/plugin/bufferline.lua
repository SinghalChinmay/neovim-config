
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

vim.keymap.set("n", "<C-RIGHT>", vim.cmd.BufferLineCycleNext) -- Go to next buffer
vim.keymap.set("n", "<C-LEFT>", vim.cmd.BufferLineCyclePrev) -- Go to previous buffer
vim.keymap.set("n", "<leader>q", ":Bdelete!<CR>") -- Delete buffer without messing the layout
