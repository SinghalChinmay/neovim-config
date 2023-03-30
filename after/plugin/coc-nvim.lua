
local bind = vim.keymap.set

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

vim.opt.signcolumn = "yes"

-- Use Enter/Tab key for selecting the completion
bind("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "<Return>"]], opts)
bind("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : "<Tab>"]], opts)
bind("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

bind("n", "gd", "<Plug>(coc-definition)", {silent = true})
bind("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
bind("n", "gi", "<Plug>(coc-implementation)", {silent = true})
bind("n", "gr", "<Plug>(coc-references)", {silent = true})
bind("n", "<C-a>", vim.cmd.CocDiagnostics)

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
bind("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- keyset("n", "<C-k>", ":Copilot<CR>") -- Copilot completions

-- Vim Venom activation
vim.g.venom_loaded = 1
require('venom').setup()

vim.g.python3_host_prog = "/usr/bin/python3"

