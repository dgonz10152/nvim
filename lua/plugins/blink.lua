return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            ["<C-y>"] = {},
            ["<Tab>"] = { "select_and_accept", "fallback" },
            ["<S-Tab>"] = { "fallback" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            documentation = { auto_show = true },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
