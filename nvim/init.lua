local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- source init.lua
vim.api.nvim_set_keymap('n', '<leader>r', ':Reload<cr>', {noremap = true})

-- plugins
require('plugins')

-- main configuration
opt.termguicolors = true
cmd 'colorscheme dracula'

opt.number = true
opt.relativenumber = false
opt.expandtab = true
opt.smartindent = false

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
  },
  on_attach=require('completion').on_attach
}
-- bash
lspconfig.bashls.setup{
  on_attach=require('completion').on_attach
}
-- javascript
lspconfig.tsserver.setup{
  on_attach=require('completion').on_attach
}
-- python
lspconfig.pyright.setup{
  on_attach=require('completion').on_attach
}

-- neovim-completion
opt.completeopt=[[menuone,noinsert,noselect]]


-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = { 'yaml' }
  },
}

-- fuzzysearch
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<cr>', {noremap = true})

-- which-key
require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
