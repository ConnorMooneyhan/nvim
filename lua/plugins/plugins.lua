return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },
  { 'nvim-lua/plenary.nvim' }, -- lua coroutine support
  { 'nvim-lua/popup.nvim' }, -- vim-compatible popup support
  { -- telescope
    'nvim-telescope/telescope.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
  },
  { -- treesitter with textobjects
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "bash", "css", "dockerfile", "html", "lua", "latex",
          "javascript", "php", "rust", "scss", "sql", "toml",
          "tsx", "typescript", "vim", "yaml",
        },
        indent = { enable = true },
        highlight = { enable = true },
        autotag = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['if'] = '@function.inner',
              ['af'] = '@function.outer',
              ['ic'] = '@call.inner',
              ['ac'] = '@call.outer',
            }
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = { ['<C-\'>'] = '@function.outer' },
            goto_next_end = {},
            goto_previous_start = { ['<C-;>'] = '@function.outer' },
            goto_previous_end = {},
          },
          lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = { ['<leader>df'] = '@function.outer' }
          }
        },
      }
    end,
  },
  { -- base lsp setup
    'mason-org/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  { 'mason-org/mason-lspconfig.nvim', version = "v1.32.0" },
  { -- completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-emoji',
    'saadparwaiz1/cmp_luasnip',
  },
  { -- snippets
    'L3MON4D3/LuaSnip',
  },
  { 'sbdchd/neoformat' },
  {
    'tpope/vim-commentary',
    'JoosepAlviste/nvim-ts-context-commentstring'
  },
  { 'simrat39/rust-tools.nvim' }, -- rust-specific code actions
  { 'cohama/lexima.vim' }, -- auto-pair feature
  { 'windwp/nvim-ts-autotag' }, -- autoclose and autorename xml tags
  { 'tpope/vim-surround' }, -- surroundings deletion and insertion
  { -- git integration
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim'
  },
  { 'fladson/vim-kitty' }, -- kitty.conf highlight support
  { 'folke/todo-comments.nvim' },
}
