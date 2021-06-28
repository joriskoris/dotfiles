local cmd = vim.cmd

cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq

-- common deps
paq 'nvim-lua/plenary.nvim'

-- reload plugin
paq 'famiu/nvim-reload'

-- theme
paq {'dracula/vim', as='dracula'};

-- linting
paq 'dense-analysis/ale'

-- completion
paq 'neovim/nvim-lspconfig';
paq 'nvim-lua/completion-nvim';

-- golang
paq 'fatih/vim-go'

-- random
paq {'nvim-treesitter/nvim-treesitter', run=function()
  vim.api.nvim_command('TSUpdate')
end
}

-- fuzzy search
paq 'nvim-lua/popup.nvim'
paq 'nvim-telescope/telescope.nvim'

-- random
paq 'folke/which-key.nvim'
