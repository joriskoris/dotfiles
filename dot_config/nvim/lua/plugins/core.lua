return {
  -- keybinding help
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- indents
  {
    "NMAC427/guess-indent.nvim",
    lazy = false,
    opts = {},
  },
  -- indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  -- theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      local function sync_theme()
        local handle = io.popen(
          "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode' 2>/dev/null"
        )
        if handle then
          local result = handle:read("*a"):gsub("%s+", "")
          handle:close()
          vim.o.background = (result == "true") and "dark" or "light"
        end
      end

      -- Set initial theme
      sync_theme()
      vim.cmd("colorscheme rose-pine")

      -- Poll every 500ms - fuck it, it works
      local timer = vim.uv.new_timer()
      timer:start(0, 500, function()
        vim.schedule(sync_theme)
      end)
    end,
  },
  -- neovim tree
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup()
    end,
    keys = {
      { "<leader>\\", ":NvimTreeToggle<CR>", desc = "NvimTree oggle", silent = true },
    },
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  --
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    opts = {
      startVisible = false,
      highlightColor = { link = "Comment" },
    },
    keys = {
      { "<leader>pt", ":Precognition toggle<CR>", desc = "Precognition toggle", silent = true },
    },
  },
  -- git things
  {
    "lewis6991/gitsigns.nvim",
  },
}
