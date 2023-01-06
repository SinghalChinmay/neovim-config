
local key = vim.keymap

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

vim.opt.signcolumn = "yes"

-- Use Enter/Tab key for selecting the completion
key.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "<Return>"]], opts)
key.set("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : "<Tab>"]], opts)

key.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
key.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
key.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
key.set("n", "gr", "<Plug>(coc-references)", {silent = true})
key.set("n", "<C-a>", vim.cmd.CocDiagnostics)

-- keyset("n", "<C-k>", ":Copilot<CR>") -- Copilot completions

-- Vim Venom activation
vim.g.venom_loaded = 1
require('venom').setup()

