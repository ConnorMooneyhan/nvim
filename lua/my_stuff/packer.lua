vim.cmd "packadd packer.nvim"

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- package manager
  -- use { 'catppuccin/nvim', as = 'catppuccin' } -- color scheme
  use 'rose-pine/neovim'
  use 'nvim-lua/plenary.nvim' -- lua coroutine support
  use 'nvim-lua/popup.nvim' -- vim-compatible popup support
  use { -- telescope
    'nvim-telescope/telescope.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
  }
  use { -- treesitter
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
  }
  use { -- base lsp setup
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use { -- completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-emoji',
    'saadparwaiz1/cmp_luasnip',
  }
  use { -- snippets
    'L3MON4D3/LuaSnip',
  }
  use 'sbdchd/neoformat'
  use {
    'tpope/vim-commentary',
    'JoosepAlviste/nvim-ts-context-commentstring'
  }
  use 'simrat39/rust-tools.nvim' -- rust-specific code actions
  use 'cohama/lexima.vim' -- auto-pair feature
  use 'windwp/nvim-ts-autotag' -- autoclose and autorename xml tags
  use 'tpope/vim-surround' -- surroundings deletion and insertion
  use { -- git integration
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim'
  }
  use 'fladson/vim-kitty' -- kitty.conf highlight support
  use 'folke/todo-comments.nvim'
end)
