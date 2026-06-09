return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "latte", -- latte, frappe, macchiato, mocha
      custom_highlights = function(colors)
        return {
          Folded = { fg = colors.red },
        }
      end,
      transparent_background = false,
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
        telescope = { enabled = true },
        mason = true,
        mini = { enabled = true },
        blink_cmp = true,
        alpha = true,
      },
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
