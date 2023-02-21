local M = {}

local function bind(op, outer_opts)
  outer_opts = outer_opts or {noremap = true}
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
      outer_opts,
      opts or {}
    )
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

M.nnoremap = bind('n', { remap = true })
M.vnoremap = bind('v', { remap = true })
M.xnoremap = bind('x', { remap = true })
M.inoremap = bind('i', { remap = true })
M.tnoremap = bind('t', { remap = true })

return M
