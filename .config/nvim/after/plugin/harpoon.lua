local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local cmd_ui = require("harpoon.cmd-ui")
local term = require("harpoon.term")

harpoon.setup{}

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>qj", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>qk", cmd_ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>j", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>k", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>l", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>;", function() ui.nav_file(4) end)

vim.keymap.set("n", "<leader>tj", function() term.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>tk", function() term.gotoTerminal(2) end)
vim.keymap.set("n", "<leader>tl", function() term.gotoTerminal(3) end)
vim.keymap.set("n", "<leader>t;", function() term.gotoTerminal(4) end)
