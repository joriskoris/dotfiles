return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
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
        docker_compose_language_service = {},
        dockerls = {},
        lua_ls = {},
        bashls = {},
      }
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
      })

      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup({
        ensure_installed = {},
        auto_enable = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            require("lspconfig")[server_name].setup(server)
          end,
        },
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
