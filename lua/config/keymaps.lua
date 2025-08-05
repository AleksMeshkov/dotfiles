-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffer/Tab navigation keymaps (LazyVim uses buffers as tabs)
vim.keymap.set("n", "<leader><tab>]", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>enew<cr>", { desc = "New Buffer" })
vim.keymap.set("n", "<leader><tab>d", function() Snacks.bufdelete() end, { desc = "Close Buffer" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>bfirst<cr>", { desc = "First Buffer" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>blast<cr>", { desc = "Last Buffer" })
vim.keymap.set("n", "<leader><tab>o", function() Snacks.bufdelete.other() end, { desc = "Close Other Buffers" })

-- Project management with Snacks
vim.keymap.set("n", "<leader>fp", function()
  Snacks.picker.projects()
end, { desc = "Find Projects" })
