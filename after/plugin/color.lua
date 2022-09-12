vim.cmd("colorscheme catppuccin")

local unused = true
local colors = require('catppuccin.palettes').get_palette()

vim.cmd('hi DiagnosticUnderlineError gui=undercurl')
vim.cmd('hi DiagnosticUnderlineWarn gui=undercurl')
vim.cmd('hi DiagnosticUnderlineHint gui=undercurl')
