function _G.change_theme(theme)
	local to_set = theme or "sonokai"
	if theme == "material" then
		vim.g.material_style = "darker"
	elseif theme == "sonokai" then
		vim.g.sonokai_style = "shusia"
		vim.g.sonokai_better_performance = 1
	end
	vim.cmd.colorscheme(to_set)
end

change_theme()

