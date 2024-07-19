local group = vim.api.nvim_create_augroup("format_ts", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = "*.ts",
  command = "silent! !npx prettier --write %"
})
