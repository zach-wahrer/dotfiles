vim.api.nvim_exec([[autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()]], false)
vim.api.nvim_exec([[autocmd BufWritePre *.tfvars lua vim.lsp.buf.formatting_sync()]], false)
