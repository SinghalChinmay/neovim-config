local bind = vim.keymap.set

-- Normal + Visual mode keybindings
bind('n', '<A-Up>', 'ddkP')
bind('n', '<A-Down>', 'ddjP')
bind('n', '<C-d>', 'yyjP')
bind({'n', 'x'}, '<leader>d', [["_d]]) -- Doesn't copy to clipboard on deletion
bind('x', '<leader>p', [["_dP]])

-- Insert mode key bindings

bind('i', 'jj', '<Esc>:w<cr>') -- Go to normal mode + save

-- Autoclose brackets and strings
bind('i', '"', '""<left>')
bind('i', "'", "''<left>")
bind('i', '(', '()<left>')
bind('i', '[', '[]<left>')
bind('i', '{', '{}<left>')
bind('i', '`', '``<left>')

