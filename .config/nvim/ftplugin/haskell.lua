local group = vim.api.nvim_create_augroup("format_haskell", { clear = true })
--vim.api.nvim_create_autocmd("BufWritePost", {
--  group = group,
--  pattern = "*.hs",
--  callback = function(args)
--    if (args.match:find("/admin-server/integration-api/", 1, true) or
--       args.match:find("/admin-server/test-integration-api/", 1, true) or
--       args.match:find("/admin-server/api/", 1, true) or
--       args.match:find("/admin-server/admin-client/", 1, true) or
--       args.match:find("/admin-server/common-network/", 1, true) or
--       args.match:find("/admin-server/common-geometry/", 1, true) or
--       args.match:find("/race-appserver/", 1, true) or
--       args.match:find("/common-api/", 1, true)) then
--      vim.cmd("silent! !fourmolu -i %")
--    else
--      vim.cmd("silent! !stylish-haskell -i %")
--    end
--  end
--})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = "*.hs",
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})
