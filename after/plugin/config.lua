require'mason'.setup()
require'rust-tools'.setup {}

require'mason-lspconfig'.setup {
  automatic_installation = false,
  ensure_installed = {
    'cssmodules_ls',
    'cssls',
    'cucumber_language_server',
    'html',
    'intelephense',
    'jsonls',
    'phpactor',
    'rust_analyzer',
    'sumneko_lua',
    'tailwindcss',
    'tsserver',
    'vimls',
    'yamlls'
  }
}

local lspconfig = require'lspconfig'
lspconfig.rust_analyzer.setup {}
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
lspconfig.tsserver.setup {
  init_options = {
    preferences = {
      includeCompletionsForImportStatements = true,
    }
  }
}

local luasnip = require'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Enter>'] = cmp.mapping.confirm { select = true },
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end)
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'emoji' },
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
}

cmp.setup.cmdline(':', {
  mapping = {
    ['<C-Enter>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'c' }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
    ['<C-e>'] = cmp.mapping(cmp.mapping.complete(), { 'c' }),
  },
  sources = {
    { name = 'cmdline' },
    { name = 'emoji' },
    { name = 'path' },
  }
})

cmp.setup.cmdline('/', {
  mapping = {
    ['<C-Enter>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'c' }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
  },
  sources = {
    { name = 'buffer' },
  }
})

local lsp = require'lsp-zero'
lsp.preset'lsp-only'
lsp.nvim_workspace()
lsp.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "html",
    "lua",
    "javascript",
    "php",
    "rust",
    "scss",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  },
  autotag = { -- nvim-ts-autotag 
    enable = true,
  },
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
      goto_next_start = {
        ['<C-\'>'] = '@function.outer'
      },
      goto_next_end = {},
      goto_previous_start = {
        ['<C-;>'] = '@function.outer'
      },
      goto_previous_end = {},
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ['<leader>df'] = '@function.outer',
      }
    }
  },
  context_commentstring = {
    enable = true
  }
}

local colors = require'catppuccin.palettes'.get_palette()
require'catppuccin'.setup {
  integrations = {
    gitsigns = true,
    cmp = true,
    telescope = true,
    treesitter = true,
    nvimtree = true
  },
  highlight_overrides = {
    LineNr = { guifg = '#F0C6C6' }
  }
}

require'telescope'.setup {
  -- defaults = {
  --   border = false
  -- }
}

local autopairs = require'nvim-autopairs'
local Rule = require'nvim-autopairs.rule'
autopairs.setup()
autopairs.add_rules { -- add extra space between pairs
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),
  Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
        return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(']')
} 
