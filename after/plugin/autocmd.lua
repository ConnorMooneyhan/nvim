local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {pattern = '*.js', command = 'Neoformat prettier'})

-- implementing git branch on statusline! from https://www.reddit.com/r/neovim/comments/upe3xx/minimalist_lua_global_statusline_nvim_07_apis_lsp/
autocmd({'BufWinEnter', 'ShellCmdPost'}, {
  desc = 'git branch for statusline',
  callback = function()
    if vim.fn.isdirectory '.git' ~= 0 then
      vim.b.branch_name = vim.fn.system "git branch --show-current | tr -d '\n'"
    end
  end
})
vim.opt.laststatus = 3 -- use global statusline
vim.opt.statusline = " %f%=%{get(b:, 'branch_name', '')} "
