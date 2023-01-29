
local bind = vim.keymap.set

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

vim.opt.signcolumn = "yes"

-- Use Enter/Tab key for selecting the completion
bind("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "<Return>"]], opts)
bind("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : "<Tab>"]], opts)

bind("n", "gd", "<Plug>(coc-definition)", {silent = true})
bind("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
bind("n", "gi", "<Plug>(coc-implementation)", {silent = true})
bind("n", "gr", "<Plug>(coc-references)", {silent = true})
bind("n", "<C-a>", vim.cmd.CocDiagnostics)

-- keyset("n", "<C-k>", ":Copilot<CR>") -- Copilot completions

-- Vim Venom activation
vim.g.venom_loaded = 1
require('venom').setup()

vim.g.python3_host_prog = "/usr/bin/python3"

