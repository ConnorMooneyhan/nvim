vim.cmd("colorscheme catppuccin")

local unused = true
local colors = require('catppuccin.palettes').get_palette()

vim.cmd('hi DiagnosticUnderlineError gui=undercurl')
vim.cmd('hi DiagnosticUnderlineWarn gui=undercurl')
vim.cmd('hi DiagnosticUnderlineHint gui=undercurl')

-- catppuccin colors list:

-- rosewater
-- flamingo
-- pink
-- mauve
-- red
-- maroon
-- peach
-- yellow
-- green
-- teal
-- sky
-- sapphire
-- blue
-- lavender

-- text
-- subtext1
-- subtext0
-- overlay2
-- overlay1
-- overlay0
-- surface2
-- surface1
-- surface0

-- base
-- mantle
-- crust
