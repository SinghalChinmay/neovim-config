
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "   Find text", ":Telescope live_grep <CR>"),
	dashboard.button("s", "   Settings", ":e $MYVIMRC<CR>"),
	dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

