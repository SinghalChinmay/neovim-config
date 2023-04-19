local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local bind = vim.keymap.set

bind("n", "<leader>af", mark.add_file)
bind("n", "<C-o>", ui.toggle_quick_menu)

bind("n", "<C-[>", function() ui.nav_next() end)
bind("n", "<C-]>", function() ui.nav_next() end)

bind("n", "<leader>j", function() ui.nav_file(1) end)
bind("n", "<leader>k", function() ui.nav_file(2) end)
bind("n", "<leader>l", function() ui.nav_file(3) end)

