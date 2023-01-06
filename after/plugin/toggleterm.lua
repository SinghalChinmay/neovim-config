
require("toggleterm").setup({
	hide_numbers = true,
	start_in_insert = true,
	direction = "float",
	close_on_exit = true,
	auto_scroll = true,
}
)

local key = vim.keymap

function _G.set_terminal_keymaps()
	local opts = {buffer = 0}
	key.set('t', '<esc>', [[<C-\><C-n>]], opts)
	key.set('t', 'jk', [[<C-\><C-n>]], opts) -- Comming back to normal mode from insert mode in the terminal
	key.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	key.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	key.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	key.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
key.set("n", "<C-j>", vim.cmd.ToggleTerm) -- Toggling the terminal

