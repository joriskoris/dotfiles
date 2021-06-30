local cmd = vim.cmd
local fn = vim.fn

cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself

-- common deps
paq 'nvim-lua/plenary.nvim'

-- reload plugin
paq 'famiu/nvim-reload'

-- theme
paq {'dracula/vim', as='dracula'}

-- linting
paq 'dense-analysis/ale'

-- completion
paq 'neovim/nvim-lspconfig'
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}

-- snippets
paq 'Shougo/neosnippet.vim'
paq 'Shougo/neosnippet-snippets'

-- golang
paq 'fatih/vim-go'

-- terraform
paq 'hashivim/vim-terraform'

-- random
paq 'nvim-treesitter/nvim-treesitter'

-- fuzzy search
paq 'nvim-lua/popup.nvim'
paq 'nvim-telescope/telescope.nvim'

-- random
paq 'folke/which-key.nvim'
