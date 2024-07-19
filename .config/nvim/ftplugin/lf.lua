--local group = vim.api.nvim_create_augroup("format_lf", { clear = true })
--vim.api.nvim_create_autocmd("BufWritePost", {
--  group = group,
--  pattern = "*.lf",
--  command = "silent! !~/dev/hslf/format.sh %"
--})

vim.keymap.set("n", "<leader><leader>f", ":silent! !~/dev/hslf/format.sh %<CR>")
