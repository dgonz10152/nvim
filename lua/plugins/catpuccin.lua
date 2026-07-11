return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      custom_highlights = function(colors)
        return {
          Folded = { fg = colors.red },
          -- Transparent Telescope
          TelescopeNormal = { bg = "NONE" },
          TelescopeBorder = { bg = "NONE" },
          TelescopePromptNormal = { bg = "NONE" },
          TelescopePromptBorder = { bg = "NONE" },
          TelescopePromptTitle = { bg = "NONE", fg = colors.mauve },
          TelescopeResultsNormal = { bg = "NONE" },
          TelescopeResultsBorder = { bg = "NONE" },
          TelescopeResultsTitle = { bg = "NONE" },
          TelescopePreviewNormal = { bg = "NONE" },
          TelescopePreviewBorder = { bg = "NONE" },
          TelescopePreviewTitle = { bg = "NONE", fg = colors.green },
        }
      end,
      transparent_background = true,
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
