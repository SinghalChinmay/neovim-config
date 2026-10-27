require('mason').setup({
	ui = {
		border = 'rounded'
	}
})
require("mason-lspconfig").setup({
  handlers = {
    function(server_name)
      -- Natively enable the server without calling require('lspconfig')
      vim.lsp.enable(server_name)
    end,
  }
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = '✘',
			[severity.WARN] = '▲',
			[severity.HINT] = '⚑',
			[severity.INFO] = '»',
		},
	},
})

local bind = vim.keymap
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP Actions',
  callback = function(event)
    local opts = { buffer = event.buf, remap = false }

    bind.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    bind.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    bind.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    bind.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    bind.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    bind.set("n", "gr", function() vim.lsp.buf.references() end, opts)
	bind.set("n", "<leader>ca", function () vim.lsp.buf.code_action() end, opts)
  end,
})
-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- vim.lsp.config("lua_ls", {
-- 	cmd = {"lua-language-server"},
-- 	filetypes = {'lua'},
-- })
-- vim.lsp.enable("lua_ls")

-- 		['<C-u>'] = cmp.mapping.scroll_docs(-4),
-- 		['<C-d>'] = cmp.mapping.scroll_docs(4),
-- 		['<C-e>'] = cmp.mapping.abort(),
