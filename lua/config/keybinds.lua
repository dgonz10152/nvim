-- Shift+Enter to accept blink.cmp completion
vim.keymap.set("i", "<S-CR>", function()
  require("blink.cmp").select_and_accept()
end, { desc = "Accept blink.cmp completion" })

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open Oil" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })

-- Diffview
vim.keymap.set("n", "<leader>hh", function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen")
  else
    vim.cmd("DiffviewClose")
  end
end, { desc = "Toggle Diffview" })
vim.keymap.set("n", "<leader>hf", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history (current file)" })
vim.keymap.set("n", "<leader>hF", "<cmd>DiffviewFileHistory<cr>", { desc = "File history (branch)" })

-- Copy filepath
vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy absolute filepath" })

-- Diagnostics
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic float" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

