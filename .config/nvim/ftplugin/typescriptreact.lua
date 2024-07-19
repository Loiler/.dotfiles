local group = vim.api.nvim_create_augroup("format_tsreact", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = "*.tsx",
  command = "silent! !npx prettier --write %"
})
