local key = vim.keymap

-- Normal mode keybindings
key.set('n', '<A-Up>', 'ddkP')
key.set('n', '<A-Down>', 'ddjP')
key.set('n', '<C-d>', 'yyjP') 

-- Insert mode key bindings

key.set('i', 'jj', '<Esc>:w<cr>') -- Go to normal mode + save

-- Autoclose brackets and strings
key.set('i', '"', '""<left>')
key.set('i', "'", "''<left>")
key.set('i', '(', '()<left>')
key.set('i', '[', '[]<left>')
key.set('i', '{', '{}<left>')
key.set('i', '`', '``<left>')

