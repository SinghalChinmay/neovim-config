
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_WindowLayout = 3 -- Window layout style

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.undodir" -- Path to store the undofiles
vim.opt.undofile = true

