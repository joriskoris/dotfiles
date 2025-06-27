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
  -- filetree
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    keys = {
      { "<leader>\\", ":Neotree toggle<CR>", desc = "NeoTree toggle", silent = true },
    },
    opts = {},
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
}
