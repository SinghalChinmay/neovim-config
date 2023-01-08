local bind = vim.keymap.set

-- Normal + Visual mode keybindings

bind('v', '<A-Down>', ":m '>+<CR>gv=gv") -- "'>" is the mark to identify the selection end.
bind('v', '<A-Up>', ":m '<-2<CR>gv=gv")
bind('n', '<A-Down>', ":m +1<CR>==") -- == Reindents the line
bind('n', '<A-Up>', ":m -2<CR>==")

bind('n', '<C-d>', 'yyjP')
bind({'n', 'x'}, '<leader>d', [["_d]]) -- Doesn't copy to clipboard on deletion

bind('n', '<leader>fr', [[:%s//<left>]]) -- Find and replace an occurrence all over the file.

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

