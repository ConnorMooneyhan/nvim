vim.cmd("colorscheme catppuccin")

local unused = true
local colors = require('catppuccin.palettes').get_palette()

vim.cmd('hi DiagnosticUnderlineError gui=undercurl')
vim.cmd('hi DiagnosticUnderlineWarn gui=undercurl')
vim.cmd('hi DiagnosticUnderlineHint gui=undercurl')

local TelescopeColor = {
  TelescopeMatching = { fg = colors.flamingo },
  TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
  TelescopePromptPrefix = { bg = colors.surface0 },
  TelescopePromptNormal = { bg = colors.surface0 },
  TelescopeResultsNormal = { bg = colors.mantle },
  TelescopePreviewNormal = { bg = colors.mantle },
  TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
  TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
  TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
  TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
  TelescopeResultsTitle = { fg = colors.mantle },
  TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
}

for hl, col in pairs(TelescopeColor) do
  vim.api.nvim_set_hl(0, hl, col)
end

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
