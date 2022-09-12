vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
    'nvim-telescope/telescope-file-browser.nvim'
  }
  use {
   'nvim-treesitter/nvim-treesitter',
   'windwp/nvim-ts-autotag',
  }
  use 'tpope/vim-fugitive'
  use {
    'VonHeikemen/lsp-zero.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  }
  use 'simrat39/rust-tools.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'jiangmiao/auto-pairs'
  use 'airblade/vim-gitgutter'
  use 'sbdchd/neoformat'
  use 'folke/lsp-colors.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'terrortylor/nvim-comment'
  use 'kyazdani42/nvim-tree.lua'
  use 'rrethy/nvim-base16'
end)
