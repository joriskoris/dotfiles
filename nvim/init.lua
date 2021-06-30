local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- source init.lua
vim.api.nvim_set_keymap('n', '<leader>r', ':Reload<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>e', ':e $MYVIMRC<cr>', {noremap = true})
-- remap jk to esc
vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true})

-- plugins
require('plugins')

-- main configuration
opt.termguicolors = true
cmd 'colorscheme dracula'

opt.number = true
opt.relativenumber = false
opt.expandtab = true
opt.tabstop = 2
opt.smartindent = true
opt.shiftwidth = 2
opt.wrap = false

-- language server
local lspconfig = require('lspconfig')
-- golang
g.go_code_completion_enabled = 0
lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  }
}
-- bash
lspconfig.bashls.setup {}
-- terraform
lspconfig.terraformls.setup {}

-- completion plugins
g.python3_host_prog = "~/.pyenv/versions/neovim/bin/python"
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
-- mappings for deoplete
vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>(neosnippet_expand_or_jump)', {noremap=false})
vim.api.nvim_set_keymap('s', '<C-k>', '<Plug>(neosnippet_expand_or_jump)', {noremap=false})
vim.api.nvim_set_keymap('x', '<C-k>', '<Plug>(neosnippet_expand_target)', {noremap=false})

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = { 'yaml' }
  },
  indent = {
    enable = true,
  }
}

-- fuzzysearch
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<cr>', {noremap = true})

-- which-key
require("whichkey_setup").config{
  hide_statusline = false,
  default_keymap_settings = {
    silent=true,
    noremap=true,
  },
  default_mode = 'n',
}


-- vim-terraform
g.terraform_align = 1
g.terraform_fmt_on_save = 1

-- comments
require('kommentary.config').use_extended_mappings()
