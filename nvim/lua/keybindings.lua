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
