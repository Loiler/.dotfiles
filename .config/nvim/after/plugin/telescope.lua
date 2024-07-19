local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

telescope.load_extension("ui-select")
telescope.setup {
  extensions = {
    ["ui-select"] = {
      telescope_themes.get_dropdown {
        -- even more opts
      }
    }
  }
}

vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep)
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags)
vim.keymap.set("n", "<leader>fk", telescope_builtin.keymaps)
vim.keymap.set("n", "<leader>gc", telescope_builtin.git_commits)
vim.keymap.set("n", "<leader>gb", telescope_builtin.git_branches)
vim.keymap.set("n", "<leader>gss", telescope_builtin.git_status)
vim.keymap.set("n", "<leader>gst", telescope_builtin.git_stash)
