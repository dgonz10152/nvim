-- Shift+Enter to accept blink.cmp completion
vim.keymap.set("i", "<S-CR>", function()
  require("blink.cmp").select_and_accept()
end, { desc = "Accept blink.cmp completion" })

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open Oil" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })

