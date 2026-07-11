return {
  "APZelos/blamer.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.blamer_enabled = 1
    vim.g.blamer_delay = 200
    vim.g.blamer_date_format = "%m/%d/%Y"
  end,
}
