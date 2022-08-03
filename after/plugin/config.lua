require('lspconfig').rust_analyzer.setup({})
require('mason').setup()
require('rust-tools').setup({})

require('mason-lspconfig').setup({
  automatic_installation = false,
  ensure_installed = {
    'cssmodules_ls',
    'cssls',
    'cucumber_language_server',
    'emmet_ls',
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

require('lualine').setup({
  options = {
    theme = 'everforest',
    refresh = { statusline = 100 }
  }
})

local cmp = require('cmp')
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.close(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
