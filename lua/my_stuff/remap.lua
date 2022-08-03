local keymap = require('my_stuff.keymap')

local map = keymap.map
local n = keymap.nnoremap
local v = keymap.vnoremap
local x = keymap.xnoremap
local i = keymap.inoremap
local t = keymap.tnoremap

n('<leader>e', '<cmd>NERDTreeToggle<CR>')
n('<leader>f', require("telescope.builtin").find_files)
n('<leader>t', '<cmd>15 split | term<CR> <cmd>set number& relativenumber& signcolumn&<CR> i')
n('<leader>q', '<cmd>q<CR>')
n('<silent>gd', 'vim.lsp.buf.definition')
n('<silent>gtd', 'vim.lsp.buf.type_definition')
n('<silent>gr', 'vim.lsp.buf.references')
n('<C-h>', '<C-w>h')
n('<C-j>', '<C-w>j')
n('<C-k>', '<C-w>k')
n('<C-l>', '<C-w>l')

t('<Esc>', '<C-\\><C-n>')
t('<C-h>', '<C-\\><C-n><C-w>h')
t('<C-j>', '<C-\\><C-n><C-w>j')
t('<C-k>', '<C-\\><C-n><C-w>k')
t('<C-l>', '<C-\\><C-n><C-w>l')

i('<C-h>', '<Esc><C-w>h')
i('<C-j>', '<Esc><C-w>j')
i('<C-k>', '<Esc><C-w>k')
i('<C-l>', '<Esc><C-w>l')
