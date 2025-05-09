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

  vim.api.nvim_cmd({ cmd = 'e', args = { filteredItems[1].filename } }, {})
  vim.api.nvim_cmd({
    cmd = 'call', args = {
      "cursor(" .. filteredItems[1].lnum .. ", " .. filteredItems[1].col .. ")"
    }
  }, {})
  vim.api.nvim_cmd({ cmd = "normal", args = { "zz" } }, {})
end

n('<leader>e', function () telescope.find_files{ default_text = vim.fn.expand('%:h') } end)
n('<leader>p', telescope.find_files)
n('<leader>s', telescope.live_grep)
n('<leader>q', telescope.quickfix)
n('<leader>f', ':Neoformat<CR>')
n('<leader>c', ':!pdflatex -output-directory=%:h % <CR>')
n('<leader>mk', ':move .-2<CR>')
n('<leader>mj', ':move .+1<CR>')
n('<leader>rc', ':!cargo-run-this %<CR>')
n('<leader>rn', ':!node %<CR>')
n('gd', function () vim.lsp.buf.definition({ on_list = on_def_list }) end)
n('gtd', function () vim.lsp.buf.type_definition() end)
n('gr', function () vim.lsp.buf.references() end)
n('gn', function () vim.lsp.buf.rename() end)
n('<C-h>', '<C-w>h')
n('<C-j>', '<C-w>j')
n('<C-k>', '<C-w>k')
n('<C-l>', '<C-w>l')
n('<C-Space>', 'o<Esc>O')

t('<Esc>', '<C-\\><C-n>')
t('<C-h>', '<C-\\><C-n><C-w>h')
t('<C-j>', '<C-\\><C-n><C-w>j')
t('<C-k>', '<C-\\><C-n><C-w>k')
t('<C-l>', '<C-\\><C-n><C-w>l')

i('<C-l>', '<Del>')
i('<C-Space>', '<CR><Esc>O')
i('<C-;>', '<Esc>A;');
i('<Up>', '')
i('<Down>', '')
