return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lspsaga").setup({
            symbol_in_winbar = { enable = true },
            lightbulb = { enable = false },
        })

        local map = vim.keymap.set

        map("n", "K",          "<cmd>Lspsaga hover_doc<cr>",          { desc = "Hover doc" })
        map("n", "gd",         "<cmd>Lspsaga peek_definition<cr>",    { desc = "Peek definition" })
        map("n", "gD",         "<cmd>Lspsaga goto_definition<cr>",    { desc = "Go to definition" })
        map("n", "gr",         "<cmd>Lspsaga finder<cr>",             { desc = "LSP finder" })
        map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>",        { desc = "Code action" })
        map("n", "<leader>rn", "<cmd>Lspsaga rename<cr>",             { desc = "Rename" })
        map("n", "<leader>o",  "<cmd>Lspsaga outline<cr>",            { desc = "Symbol outline" })
    end,
}
