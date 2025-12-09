return {
  {
    "qvalentin/helm-ls.nvim",
    ft = "helm",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "b0o/schemastore.nvim",
      -- Useful status updates for LSP.
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
    },
    config = function()
      -- LSP keybindings when attaching to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Essential LSP keybindings
          map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
          map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
          map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
          map("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          map("K", vim.lsp.buf.hover, "Hover Documentation")

          -- Diagnostics
          map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")
        end,
      })

      local servers = {
        basedpyright = {},
        ruff = {},
        docker_compose_language_service = {},
        dockerls = {},
        lua_ls = {},
        bashls = {},
        eslint = {},
        rust_analyzer = {},
        helm_ls = {},
        jsonls = {
          settings = {
            schemas = require("schemastore").json.schemas(), -- Integrates with SchemaStore.nvim for common schemas
            validate = { enable = true },
          },
        },
        yamlls = {
          settings = {
            redhat = {
              telemetry = {
                enabled = false,
              },
            },
            yaml = {
              validate = true,
              format = {
                enable = true,
              },
              schemas = {
                kubernetes = "*.k8s.yaml",
                ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = "roles/tasks/*.{yml,yaml}",
                ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
                ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["https://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["https://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
              },
            },
          },
        },
        stylua = {},
        tofu_ls = {
          cmd = { "tofu-ls", "serve" },
          filetypes = { "terraform", "terraform-vars" },
          root_markers = { ".terraform", ".git" },
        },
        tailwindcss = {},
      }
      local ensure_installed = vim.tbl_keys(servers or {})
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      -- iterate over the list of servers, and call `vim.lsp.config(name, settings)` for each setting
      for server_name, config in pairs(servers) do
        vim.lsp.config(server_name, config)
      end

      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_enable = true,
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  -- lua local development
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
