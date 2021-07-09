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
  {'nvim-treesitter/nvim-treesitter', run=function() vim.cmd 'TSUpdate' end};

  -- completion
  'nvim-lua/completion-nvim';

  -- snippets
   'norcalli/snippets.nvim';

  -- golang
  'fatih/vim-go';

  -- starlark
  'cappyzawa/starlark.vim';

  -- terraform
  'hashivim/vim-terraform';

  -- mustache
  'mustache/vim-mode';

  -- markdown
  {'npxbr/glow.nvim', run=function() vim.cmd('GlowInstall') end};

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
