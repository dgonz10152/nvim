return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    event = "VeryLazy",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "tabs",
                separator_style = "thin",
                always_show_bufferline = true,
                show_buffer_close_icons = true,
                show_close_icon = false,
                color_icons = true,
                indicator = {
                    style = "underline",
                },
            },
            highlights = require("catppuccin.special.bufferline").get_theme(),
        })
    end,
}
