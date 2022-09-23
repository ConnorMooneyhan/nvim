-- lualine setup
local should_shorten = true
local shorten_branch = function(str)
  return string.len(str) >= 15 and string.sub(str, 1, 15) .. '...' or str
end
require('lualine').setup({
  options = {
    theme = 'catppuccin', -- also try everforest
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
    'nvim-tree',
    'fugitive',
    'quickfix',
  }
})

-- require('luasnip.loaders.from_vscode').lazy_load()
-- Enable LSP snippets within cmp.setup
-- snippet = {
--   expand = function(args)
--     require('luasnip').lsp_expand(args.body)
--   end,
-- },
-- sources = {
--   { name = 'luasnip' },
-- }

-- using lsp-zero for nvim-cmp setup
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

-- nvim-tree setup
require('nvim-tree').setup({
  hijack_cursor = true,
  view = {
    relativenumber = true,
    signcolumn = 'auto',
  }
})

-- I don't know what this did but it seems like it was important
vim.lsp.handlers['testDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 5,
      severity_limit = 'Warning',
    },
    update_in_insert = true,
  }
)

