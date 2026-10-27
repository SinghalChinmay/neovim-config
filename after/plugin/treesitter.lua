local ts = require("nvim-treesitter")

local langs = {"javascript", "typescript", "python", "c", "lua", "rust", "cpp"}
ts.install(langs)

vim.api.nvim_create_autocmd("FileType", {
	pattern = langs,
	callback = function ()
		pcall(vim.treesitter.start)
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = langs,
	callback = function (ev)
		if ev.match == "c" then
			vim.bo.indentexpr = ""
		else
			vim.bo.smartindent = true
		end
	end
})
