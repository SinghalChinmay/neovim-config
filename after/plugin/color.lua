
function change_theme(theme)
	to_set = theme or "material"
	vim.g.material_style = "darker" 	
	vim.cmd.colorscheme(to_set)
end

change_theme()

