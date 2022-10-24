local keymap = require('my_stuff.keymap')
local telescope = require('telescope.builtin')

local map = keymap.map
local n = keymap.nnoremap
local v = keymap.vnoremap
local x = keymap.xnoremap
local i = keymap.inoremap
local t = keymap.tnoremap

n('<leader>e', function () telescope.find_files{ default_text = vim.fn.expand('%:h') } end)
n('<leader>p', telescope.find_files)
n('<leader>s', telescope.live_grep)
n('<leader>f', ':Neoformat<CR>')
n('<leader>q', ':q<CR>')
n('<leader>mk', ':move .-2<CR>')
n('<leader>mj', ':move .+1<CR>')
n('<silent>gd', vim.lsp.buf.definition)
n('<silent>gtd', vim.lsp.buf.type_definition)
n('<silent>gr', vim.lsp.buf.references)
n('<silent>gn', vim.lsp.buf.rename)
n('<C-h>', '<C-w>h')
n('<C-j>', '<C-w>j')
n('<C-k>', '<C-w>k')
n('<C-l>', '<C-w>l')
n('<C-Space>', 'i<CR><Up><End><CR>')

t('<Esc>', '<C-\\><C-n>')
t('<C-h>', '<C-\\><C-n><C-w>h')
t('<C-j>', '<C-\\><C-n><C-w>j')
t('<C-k>', '<C-\\><C-n><C-w>k')
t('<C-l>', '<C-\\><C-n><C-w>l')

i('<C-l>', '<Del>')
i('<C-Space>', '<CR><Up><End><CR>')
