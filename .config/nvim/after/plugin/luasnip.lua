local ls = require('luasnip')

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autsnippets = true,
}

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
vim.keymap.set("i", "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
