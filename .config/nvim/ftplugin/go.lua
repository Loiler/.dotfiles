local group = vim.api.nvim_create_augroup("format_go", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = "*.go",
  command = "silent! !go fmt -- %"
})
