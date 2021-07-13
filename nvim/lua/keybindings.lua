local map = require'functions'.map

-- remap jk to esc
map('i', 'jk', '<Esc>')

-- reload config / open vim config file
map('n', '<leader>r', ':Reload<CR>')
map('n', '<leader>e', ':e $MYVIMRC<CR>')

-- fuzzysearch
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')

-- lsp saga
map('n', '<silent><leader>ca', ':Lspsaga code_action<CR>')
map('v', '<silent><leader>ca', ':<C-U>Lspsaga range_code_action<CR>')

-- saga mappings
map('n', '<silent><leader>ca', ':Lspsaga code_action<CR>')
map('v', '<silent><leader>ca', ':<C-U>Lspsaga range_code_action<CR>')

-- comments
require'kommentary.config'.use_extended_mappings()
--[[
"gcc" - toggle comments for current line;
"gc" - toggle comment for currrent visual selection;
"gc + motion" - toggle comments with motion, eg: gc5j;
"<leader>cic" will increase commenting level for the current line, ci will do the same for a visual selection or motion;
"<leader>cdc" will decrease commenting level for the current line, di will do the same for a visual selection or motion;
]]

-- lsp bindings
local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
