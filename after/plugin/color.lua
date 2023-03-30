function _G.change_theme(theme)
	local to_set = theme or "darkplus"
	vim.g.material_style = "darker"
	vim.cmd.colorscheme(to_set)
end

change_theme()

