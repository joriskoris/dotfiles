local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- typescript = { "prettier", stop_after_first = true },
    -- typescriptreact = { "prettier", stop_after_first = true },
    python = { "ruff_organize_imports", lsp_format = "last" },
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  format_on_save = {
    timeout_ms = 500,
  },
}

return options
