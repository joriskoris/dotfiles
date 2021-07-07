local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- requires
require'plugins'
require'keybindings'

-- main configuration
opt.termguicolors = true
g.neon_style = 'doom'
cmd 'colorscheme neon'

-- statusline
require'nvim-web-devicons'.setup {
  default = true
}
require'lualine'.setup {
  options = {
    theme = 'neon'
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

-- vim-go
g.go_code_completion_enabled = 1

-- vim-terraform
g.terraform_align = 1
g.terraform_fmt_on_save = 1

-- completion settings
opt.completeopt=[[menuone,noinsert,noselect]]
opt.shortmess:append {c = true}

-- lsp
local lspconfig = require'lspconfig'
lspconfig.gopls.setup {
  on_attach = require'completion'.on_attach,
  cmd = {'gopls', 'serve'},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  }
}

-- lsp saga
local saga = require'lspsaga'
saga.init_lsp_saga()

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

-- which-key
require'whichkey_setup'.config{
  hide_statusline = false,
  default_keymap_settings = {
    silent=true,
    noremap=true,
  },
  default_mode = 'n',
}

