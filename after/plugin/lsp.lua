local lsp = require('lsp-zero').preset({})

require('mason').setup({
	ui = {
		border = 'rounded'
	}
})

lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local tabnine = require("cmp_tabnine.config")

tabnine:setup({
	max_lines = 1000;
	max_num_results = 4;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
})

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
	sources = {
		{name = "nvim_lsp"},
		{name = "buffer"},
		{name = "luasnip"},
		{name = "cmp_tabnine"},
		{name = "path"},
	},
	snippet = {
		expand = function (args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	formatting = {
		fields = {'abbr', 'kind', 'menu'},
		format = function(entry, vim_item)
	 		vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
	 		if entry.source.name == "cmp_tabnine" then
	 			vim_item.kind = "⌬"
	 			if (entry.completion_item.data or {}).multiline then
	 				vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
	 			end
	 		end
	 		local maxwidth = 50
	 		vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
	 		return vim_item
		end,
	},
	mapping = {
		['<cr>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
	},
})

