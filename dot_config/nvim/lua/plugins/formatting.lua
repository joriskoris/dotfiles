local js_formatters = { "prettier", "eslint_d" }

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = nil,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      javascript = js_formatters,
      typescript = js_formatters,
      javascriptreact = js_formatters,
      typescriptreact = js_formatters,
      css = { "prettier" },
    },
  },
}
