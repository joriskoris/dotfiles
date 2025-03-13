require("neoconf").setup {}

require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  bashls = {},
  html = {},
  cssls = {},
  ts_ls = {},
  eslint = {},
  ruff = {},
  basedpyright = {},
  tilt_ls = {},
  helm_ls = {
    yamlls = {
      path = "yaml-language-server",
    },
  },
  yamlls = {
    settings = {
      yaml = {
        completion = true,
        validate = true,
        format = { enable = true },
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        schemaDownload = { enable = true },
        schemas = {},
      },
    },
  },
  dockerls = {},
  tailwindcss = {},
  marksman = {},
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end
