
function change_theme(theme)
	to_set = theme or "codedark"
	if to_set == "material" then 
		vim.g.material_style = "darker" 
	end
	vim.cmd.colorscheme(to_set)
end

change_theme()

