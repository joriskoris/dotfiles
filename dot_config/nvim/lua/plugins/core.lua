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
    config = function()
      vim.o.background = "light"
      vim.cmd("colorscheme rose-pine")
    end,
    priority = 1000,
  },
  -- neovim tree
  {
    "nvim-tree/nvim-tree.lua",
    config = function ()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup();
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
  }
}
