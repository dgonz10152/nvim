return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-mini/mini.icons', 'catppuccin/nvim' },
    config = function()
        local dashboard = require('alpha.themes.startify')
        local palette = require('catppuccin.palettes').get_palette('mocha')

        vim.api.nvim_set_hl(0, 'AlphaHeader',  { fg = palette.blue })
        vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = palette.peach })
        vim.api.nvim_set_hl(0, 'AlphaFooter',  { fg = palette.overlay1, italic = true })

        dashboard.section.header.opts.hl = 'AlphaHeader'
        dashboard.section.header.val = {
            "",
            "░▒▓███████▓▒░░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓██████████████▓▒░",
            "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
            "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
            "░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
            "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
            "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
            "░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓██████▓▒░   ░▒▓██▓▒░  ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
        }

        local quotes = {
            [["Nothing takes place in the world whose meaning is not that of some maximum or minimum." - Leonhard Euler]],
            [["An equation for me has no meaning, unless it expresses a thought of God." - Srinivasa Ramanujan]],
            [["Beauty is the first test: there is no permanent place in the world for ugly mathematics." - G.H. Hardy]],
        }

        dashboard.section.footer = {
            type = "text",
            val = function()
                math.randomseed(os.time())
                return quotes[math.random(#quotes)]
            end,
            opts = { hl = 'AlphaFooter' },
        }

        table.insert(dashboard.config.layout, { type = "padding", val = 1 })
        table.insert(dashboard.config.layout, dashboard.section.footer)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            callback = function()
                vim.opt_local.fillchars = { eob = " " }
            end,
        })

        require'alpha'.setup(dashboard.config)
    end
}
