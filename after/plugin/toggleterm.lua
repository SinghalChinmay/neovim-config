
require("toggleterm").setup({
	hide_numbers = true,
	start_in_insert = true,
	direction = "float",
	close_on_exit = true,
	auto_scroll = true,
}
)

local bind = vim.keymap.set

function _G.set_terminal_keymaps()
	local opts = {buffer = 0}
	bind('t', '<esc>', [[<C-\><C-n>]], opts)
	bind('t', 'jk', [[<C-\><C-n>]], opts) -- Comming back to normal mode from insert mode in the terminal
	bind('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	bind('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	bind('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	bind('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
bind("n", "<C-j>", vim.cmd.ToggleTerm) -- Toggling the terminal

