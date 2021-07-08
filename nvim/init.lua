local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- requires
require'plugins'
require'keybindings'
require'lsp'

-- main configuration
opt.termguicolors = true
require'calvera'.set()

-- statusline
require'nvim-web-devicons'.setup {
  default = true
}
require'lualine'.setup {
  options = {
    theme = 'calvera-nvim'
  }
}

opt.number = true
opt.relativenumber = false
opt.expandtab = true
opt.tabstop = 2
opt.smartindent = false
opt.shiftwidth = 2
opt.wrap = true
opt.sidescrolloff = 8

-- python host
g.python3_host_prog = '~/.pyenv/versions/neovim/bin/python'

-- vim-go
g.go_code_completion_enabled = 1

-- vim-terraform
g.terraform_align = 1
g.terraform_fmt_on_save = 1

-- completion settings
opt.completeopt=[[menuone,noinsert,noselect]]
opt.shortmess:append {c = true}
g.completion_confirm_key = "<C-k>"
g.completion_enable_snippet = 'snippets.nvim'

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

-- snippets
require'snippets'.use_suggested_mappings()

-- which-key
require'which-key'.setup {}

