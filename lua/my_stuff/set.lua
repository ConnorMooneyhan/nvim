local o = vim.opt

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.hlsearch = false
o.smartindent = true
o.relativenumber = true
o.number = true
o.hidden = true
o.errorbells = false
o.scrolloff = 8
o.signcolumn = "yes"
o.completeopt = "menuone,noinsert,noselect"
o.shortmess:append("c")
o.splitright = true
o.splitbelow = true
o.mouse = ''
o.termguicolors = true
o.pumheight = 10
o.fixendofline = false

vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.neoformat_try_node_exe = 1
-- vim.g.gruvbox_flat_style = 'dark'
vim.g.Hexokinase_highlighters = { 'virtual' }
-- vim.g.catppuccin_flavour = "mocha"
vim.g.lsp_zero_extend_lspconfig = 0
