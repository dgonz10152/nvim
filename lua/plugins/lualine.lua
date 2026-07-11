return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    event = "VeryLazy",
    config = function()
        local catppuccin = require("catppuccin.palettes").get_palette("mocha")

        local function claude_status()
            local ok, cc = pcall(require, "claudecode")
            if not ok or not cc.state or not cc.state.initialized then return "" end
            return cc.is_claude_connected() and "✻ claude" or ""
        end

        local theme = {
            normal   = { a = { fg = catppuccin.base, bg = catppuccin.blue,    gui = "bold" }, b = { fg = catppuccin.text, bg = "NONE" }, c = { fg = catppuccin.text, bg = "NONE" } },
            insert   = { a = { fg = catppuccin.base, bg = catppuccin.green,   gui = "bold" } },
            visual   = { a = { fg = catppuccin.base, bg = catppuccin.mauve,   gui = "bold" } },
            replace  = { a = { fg = catppuccin.base, bg = catppuccin.red,     gui = "bold" } },
            command  = { a = { fg = catppuccin.base, bg = catppuccin.peach,   gui = "bold" } },
            inactive = { a = { fg = catppuccin.overlay0, bg = "NONE" }, b = { fg = catppuccin.overlay0, bg = "NONE" }, c = { fg = catppuccin.overlay0, bg = "NONE" } },
        }

        require("lualine").setup({
            options = {
                theme = theme,
                component_separators = { left = "|", right = "|" },
                section_separators = "",
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { { "branch", icon = "◆" }, "filename" },
                lualine_c = {
                    { claude_status, color = { fg = catppuccin.mauve } },
                },
                lualine_x = { "encoding", "fileformat", { "filetype", colored = true, icon = { align = "right" } } },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
        })
    end,
}
