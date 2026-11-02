return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	dependencies = {"rafamadriz/friendly-snippets"},
	config = function ()
		local luasnip = require("luasnip")
		local snippets = require("luasnip.loaders.from_vscode")
		
		luasnip.config.set_config({
			history = false,
			region_check_events = "InsertEnter",
			delete_check_events = "InsertLeave",
		})
		snippets.lazy_load()
		require("luasnip.loaders.from_lua").lazy_load({
			paths = {vim.fn.stdpath("config") .. "/snippets"}
		})
	end,

}
