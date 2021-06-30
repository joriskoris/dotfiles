vim.cmd 'packadd paq-nvim'

require 'paq-nvim' {
  'savq/paq-nvim';
  -- common deps
  'nvim-lua/plenary.nvim';

  -- reload plugin
  'famiu/nvim-reload';

  -- theme
  {'dracula/vim', as='dracula'};

  -- linting
  'dense-analysis/ale';
  
  -- completion
  'neovim/nvim-lspconfig';
  {'shougo/deoplete-lsp'};
  {'shougo/deoplete.nvim', run = vim.fn['remote#host#UpdateRemotePlugins']};
  
  -- snippets
  'Shougo/neosnippet.vim';
  'Shougo/neosnippet-snippets';
  
  -- golang
  'fatih/vim-go';
  
  -- terraform
  'hashivim/vim-terraform';
  
  -- random
  'nvim-treesitter/nvim-treesitter';
  
  -- fuzzy search
  'nvim-lua/popup.nvim';
  'nvim-telescope/telescope.nvim';
  
  -- random
  'folke/which-key.nvim';

  -- comments
  'b3nj5m1n/kommentary';

  -- get better at vim
  'ThePrimeagen/vim-be-good'
}
