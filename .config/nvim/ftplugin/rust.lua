local group = vim.api.nvim_create_augroup("format_rust", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = "*.rs",
  command = "silent! !cargo fmt -- %"
})
