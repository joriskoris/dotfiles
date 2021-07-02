vim.cmd 'packadd paq-nvim'

require 'paq-nvim' {
  {'savq/paq-nvim', branch='v0.8.3'};
  -- common deps
  'nvim-lua/plenary.nvim';

  -- reload plugin
  'famiu/nvim-reload';

  -- theme
  {'dracula/vim', as='dracula'};
  {'rafamadriz/neon', as='neon'};
  -- statusline
  'hoob3rt/lualine.nvim';
  'kyazdani42/nvim-web-devicons';

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
  'AckslD/nvim-whichkey-setup.lua';
  'glepnir/lspsaga.nvim';

  -- comments
  'b3nj5m1n/kommentary';

  -- get better at vim
  'ThePrimeagen/vim-be-good'
}
