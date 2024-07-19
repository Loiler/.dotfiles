local group = vim.api.nvim_create_augroup("format_cpp", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = { "*.cpp", "*.hpp" },
  command = "silent! !clang-format -i %"
})
