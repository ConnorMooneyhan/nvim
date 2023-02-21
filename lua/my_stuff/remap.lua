local keymap = require('my_stuff.keymap')
local telescope = require('telescope.builtin')

local map = keymap.map
local n = keymap.nnoremap
local v = keymap.vnoremap
local x = keymap.xnoremap
local i = keymap.inoremap
local t = keymap.tnoremap

local function on_def_list(options)
  local items = options.items
  local filteredItems = {}

  if #items > 1 then
    local unwanted_matches = { "@types", ".cargo" }
    for item=1,#items do
      local is_type_def = false
      for index=1,#unwanted_matches do
        if string.match(items[item].filename, unwanted_matches[index]) ~= nil then
          is_type_def = true
        end
      end
      if not is_type_def then
        filteredItems[#filteredItems+1] = items[item]
      end
    end
  else
    filteredItems = items
  end

  vim.fn.setqflist({}, ' ', { title = options.title, items = filteredItems, context = options.context })
  vim.api.nvim_cmd({ cmd = 'cfirst' }, {})
end

n('<leader>e', function () telescope.find_files{ default_text = vim.fn.expand('%:h') } end)
n('<leader>p', telescope.find_files)
n('<leader>s', telescope.live_grep)
n('<leader>q', telescope.quickfix)
n('<leader>f', ':Neoformat<CR>')
n('<leader>mk', ':move .-2<CR>')
n('<leader>mj', ':move .+1<CR>')
n('gd', function () vim.lsp.buf.definition({ on_list = on_def_list }) end)
n('<silent>gtd', function () vim.lsp.buf.type_definition() end)
n('<silent>gr', function () vim.lsp.buf.references() end)
n('gn', function () vim.lsp.buf.rename() end)
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
i('<Up>', '')
i('<>', '')
i('<Up>', '')
i('<Up>', '')
