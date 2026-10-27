return {
  "ap/vim-css-color",
  -- Only load when opening actual frontend/web files
  ft = { "css", "scss", "sass", "less", "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte", "lua" },
  config = function()
    -- Set an autocommand to safely stop the plugin from running on UI elements
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "NvimTree", "lazy", "mason", "notify", "qf" },
      callback = function()
        vim.b.css_color_pat = ""
      end,
    })
  end,
}
