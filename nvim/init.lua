local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- source init.lua
map('n', '<leader>r', ':Reload<CR>')
map('n', '<leader>e', ':e $MYVIMRC<CR>')
-- remap jk to esc
map('i', 'jk', '<Esc>')

-- plugins
require('plugins')

-- main configuration
opt.termguicolors = true
g.neon_style = 'dark'
cmd 'colorscheme neon'
-- statusline
require('nvim-web-devicons').setup {
  default = true
}
require('lualine').setup {
  options = {
    theme = 'neon'
  }
}

opt.number = true
opt.relativenumber = false
opt.expandtab = true
opt.tabstop = 2
opt.smartindent = true
opt.shiftwidth = 2
opt.wrap = false
opt.sidescrolloff = 8

-- language server
local lspconfig = require('lspconfig')
-- golang
g.go_code_completion_enabled = 0
lspconfig.gopls.setup {
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

cmd [[autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc]]

-- bash
lspconfig.bashls.setup {}
-- terraform
lspconfig.terraformls.setup {}
--
lspconfig.yamlls.setup {
  yaml = {
    format = {
      enable = true,
    }
  }
}
-- pyright
lspconfig.pyright.setup {}
-- mappings for lsp
map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- completion plugins
g.python3_host_prog = '~/.pyenv/versions/neovim/bin/python'
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
-- mappings for deoplete
map('i', '<C-k>', '<Plug>(neosnippet_expand_or_jump)', {noremap = false})
map('s', '<C-k>', '<Plug>(neosnippet_expand_or_jump)', {noremap = false})
map('x', '<C-k>', '<Plug>(neosnippet_expand_target)', {noremap = false})

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
  }
}

-- fuzzysearch
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')

-- which-key
require('whichkey_setup').config{
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

-- saga
local saga = require('lspsaga')
saga.init_lsp_saga()
-- saga mappings
map('n', '<silent><leader>ca', ':Lspsaga code_action<CR>')
map('v', '<silent><leader>ca', ':<C-U>Lspsaga range_code_action<CR>')
