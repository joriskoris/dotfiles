require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("vtsls", {
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 8192,
      },
    },
  },
})

vim.lsp.config("eslint", {
  settings = {
    useFlatConfig = true,
  },
})

vim.lsp.config("htmx", {
  filetypes = { "html" },
})

local servers = { "lua_ls", "vtsls", "bashls", "eslint", "terraformls", "html", "htmx", "tailwindcss" }
vim.lsp.enable(servers)
