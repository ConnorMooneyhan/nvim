local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {pattern = '*.js', command = 'Neoformat prettier'})
