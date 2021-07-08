vim.cmd 'packadd paq-nvim'

require 'paq' {
  'savq/paq-nvim';
  -- common deps
  'nvim-lua/plenary.nvim';

  -- reload plugin
  'famiu/nvim-reload';

  -- theme
  {'rafamadriz/neon', as='neon'};
  {'yashguptaz/calvera-dark.nvim'};

  -- statusline
  'hoob3rt/lualine.nvim';
  'kyazdani42/nvim-web-devicons';

  -- linting
  'dense-analysis/ale';
  
  -- lsp
  'neovim/nvim-lspconfig';
  'glepnir/lspsaga.nvim';

  -- treesitter
  'nvim-treesitter/nvim-treesitter';

  -- completion
  'nvim-lua/completion-nvim';
  
  -- golang
  'fatih/vim-go';
  
  -- terraform
  'hashivim/vim-terraform';

  -- mustache
  'mustache/vim-mode';
  
  -- fuzzy search
  'nvim-lua/popup.nvim';
  'nvim-telescope/telescope.nvim';
  
  -- Random --
  -- which-key
  'folke/which-key.nvim';
  -- comments
  'b3nj5m1n/kommentary';
  -- get better at vim
  'ThePrimeagen/vim-be-good'
}
