require('lspconfig').rust_analyzer.setup({})
require('mason').setup()
require('rust-tools').setup({})

require('mason-lspconfig').setup({
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
})

require('lspconfig').sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

should_shorten = true
function shorten_branch(str)
  return string.len(str) >= 15 and string.sub(str, 1, 15) .. '...' or str
end

require('lualine').setup({
  options = {
    theme = 'everforest',
    refresh = { statusline = 100 },
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      {
        'branch',
        -- on_click = function() print('hello from on_click') end,
        fmt = function(str) return should_shorten and shorten_branch(str) or str end,
      },
      'diff',
      'diagnostics'
    },
    lualine_c = {{
      'filename',
      path = 1,
    }},
    lualine_x = {'filetype'},
  },
  extensions = {
    'nerdtree',
    'fugitive',
    'quickfix',
  }
})

require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require('cmp')
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.close(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
})

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.configure('tsserver', {
  init_options = {
    preferences = {
      includeCompletionsForImportStatements = true,
    }
  }
})
lsp.setup()

require('nvim-treesitter.configs').setup {
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
}

-- vim.lsp.handlers['testDocument/publishDiagnostics'] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     underline = true,
--     virtual_text = {
--       spacing = 5,
--       severity_limit = 'Warning',
--     },
--     update_in_insert = true,
--   }
-- )

require('nvim_comment').setup()

require('catppuccin').setup({
  term_colors = true,
  integrations = {
    gitsigns = true,
    cmp = true,
    telescope = true,
    treesitter = true,
    nvimtree = true
  }
})

require('nvim-tree').setup()

-- require'colorizer'.setup(nil, { css = true, mode = 'foreground' })
