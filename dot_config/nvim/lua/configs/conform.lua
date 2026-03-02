local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "prettierd" },
  },
  format_on_save = false,
  default_format_opts = {
    lsp_format = "fallback",
  },
}

return options
